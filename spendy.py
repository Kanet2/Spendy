from flask import Flask, render_template, url_for, request, redirect, flash, session
from flask_mysqldb import MySQL
from flask_login import LoginManager, login_user, logout_user, current_user
from flask_mail import Mail, Message
from werkzeug.security import generate_password_hash
from models.ModelUser import ModelUser
from models.entities.User import User
import datetime
from config import config
import os

spendyApp = Flask(__name__)  
# Python anywhere
spendyApp.config.from_object(config['development'])
spendyApp.config.from_object(config['mail'])
db = MySQL(spendyApp)
mail = Mail(spendyApp)
adminSesion = LoginManager(spendyApp)

@adminSesion.user_loader
def cargaUsuario(id):
    return ModelUser.get_by_id(db, id)

# Definir el contexto global para las variables aRU y aIS
@spendyApp.context_processor
def navI():
    if current_user.is_authenticated:
        aRU = '<a class="nav-link">{current_user.nombre}</a>'
        aIS = '<a class="nav-link" href="/signout">Salir <i class="fa-solid fa-right-from-bracket"></i></a>'
    else:
        aRU = '<a class="nav-link" href="/signup">Regístrate</a>'
        aIS = '<a class="nav-link" href="/signin">Iniciar sesión <i class="fa-regular fa-user"></i></a>'

    # Pasar las variables a todas las plantillas
    return dict(Primero=aRU, Segundo=aIS)

@spendyApp.context_processor
def navR():
    if current_user.is_authenticated:
        perfil = current_user.perfil
        if perfil == 'U':
            rutaR = '/sRifa'
            rutaU = '/sPerfil'
        else:
            rutaR = '/sAdmin'
            rutaU = '/sUsuario'
        return dict(r=rutaR, u=rutaU)
    else:
        rutaR = '/sRifa'
        rutaU = '/sPerfil'
        return dict(r=rutaR, u=rutaU)

    

@spendyApp.route('/')
def home():
    return render_template('home.html')

@spendyApp.route('/sPerfil')
def perfils():
    return render_template('perfil.html')

@spendyApp.route('/preguntas')
def preguntas():
    return render_template('preguntas.html')

@spendyApp.route('/tabla')
def tabla():
    return render_template('tabla.html')

@spendyApp.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST': 
        nombre = request.form['nombre'] 
        correo = request.form['correo']
        clave = request.form['clave']
        claveCifrada = generate_password_hash(clave)
        fechaReg = datetime.datetime.now()
        regUsuario = db.connection.cursor()
        regUsuario.execute("INSERT INTO usuario (nombre, correo, clave, fechareg) VALUES(%s,%s,%s,%s)", (nombre, correo, claveCifrada, fechaReg))
        db.connection.commit()
        
        # Crear el correo
        msg = Message(subject='Bienvenido a Spendy', recipients=[correo])
        msg.html = render_template('mail.html', nombre=nombre)
        
        # Adjuntar imagen
        with spendyApp.open_resource(os.path.join('static', 'img', 'correoImg.png')) as img:
            msg.attach(
    'correoImg.png',
    'image/png',
    img.read(),
    headers={'Content-ID': '<correoImg>'}
)
        
        mail.send(msg)
        return render_template('home.html')
    else:
        return render_template('signup.html')

@spendyApp.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'POST':
        usuario = User(0, None, request.form['correo'], request.form['clave'], None, None)

        usuarioAutenticado = ModelUser.signin(db, usuario)
        if usuarioAutenticado is not None:
            if usuarioAutenticado.clave:  # Verificar si la contraseña es correcta
                login_user(usuarioAutenticado)
                session['NombreU'] = usuarioAutenticado.nombre
                session['PerfilU'] = usuarioAutenticado.perfil
                if usuarioAutenticado.perfil == 'U':
                    return render_template('home.html')  # Redirigir a la página de usuario
                else:
                    return redirect('/sAdmin')  # Redirigir a la página de administrador
            else:
                flash('Contraseña incorrecta')
                return redirect(request.url)    
        else:
            flash('Usuario inexistente')
            return redirect(request.url)
    else:
        return render_template('signin.html')

@spendyApp.route('/signout', methods=['GET', 'POST'])
def signout():
    logout_user()
    return redirect('/')

@spendyApp.route('/sUsuario', methods=['GET','POST'])
def sUsuario():
    selUsuario = db.connection.cursor()
    selUsuario.execute("SELECT * FROM usuario")
    u = selUsuario.fetchall()
    selUsuario.close()
    return render_template('usuarios.html', usuarios=u)

@spendyApp.route('/iUsuario', methods=['GET','POST'])
def iUsuario():
    nombre = request.form['nombre']
    correo = request.form['correo']
    clave = request.form['clave']
    claveCifrada = generate_password_hash(clave)
    fechareg = datetime.datetime.now()
    perfil = request.form['perfil']

    crearUsuario = db.connection.cursor()
    crearUsuario.execute("INSERT INTO usuario (nombre, correo, clave, fechareg, perfil) VALUES(%s, %s, %s, %s, %s)", (nombre, correo, claveCifrada, fechareg, perfil))
    db.connection.commit()
    flash('Usuario Creado')
    return redirect('/sUsuario')

@spendyApp.route('/uUsuario/<int:id>', methods=['GET','POST'])
def uUsuario(id):
    nombre = request.form['nombre']
    correo = request.form['correo']
    clave = request.form['clave']
    claveCifrada = generate_password_hash(clave)
    fechareg = datetime.datetime.now()
    perfil = request.form['perfil']

    editarUsuario = db.connection.cursor()
    editarUsuario.execute("Update usuario SET nombre = %s, correo = %s, clave = %s, fechareg = %s, perfil = %s WHERE id = %s",
                          (nombre, correo, claveCifrada, fechareg, perfil, id))
    db.connection.commit()
    flash('Usuario Actualizado')
    return redirect('/sUsuario')

@spendyApp.route('/dUsuario/<int:id>', methods=['GET','POST']) 
def dUsuario(id):
    eliminarCuenta = db.connection.cursor()
    eliminarCuenta.execute("DELETE FROM usuario WHERE id=%s", (id,))
    db.connection.commit()
    flash('Usuario Eliminado')
    return redirect('/sUsuario')

@spendyApp.route('/sRifa', methods=('GET', 'POST'))
def sRifa():
    selRifa = db.connection.cursor()
    selRifa.execute("SELECT * FROM rifasanuales")
    p = selRifa.fetchall()
    selRifa.close()
    return render_template('rifas.html', productos=p)

@spendyApp.route('/sAdmin', methods=('GET', 'POST'))
def sAdmin():
    selAdmin = db.connection.cursor()
    selAdmin.execute("SELECT * FROM rifasanuales")
    p = selAdmin.fetchall()
    selAdmin.close()
    return render_template('admin.html', productos=p)

@spendyApp.route("/oRifa", methods=['GET','POST'])
def oRifa():
    anio = request.form['anio']
    premio = request.form['premio']
    descripcion = request.form['descripcion']
    fechaEntrega = request.form['fechaEntrega']
    img = request.form.get('imag')

    crearUsuario = db.connection.cursor()
    crearUsuario.execute("INSERT INTO rifasanuales (anio, premio, descripcion, fechaEntrega, imag) VALUES(%s, %s, %s, %s, %s)", 
                         (anio, premio, descripcion, fechaEntrega, img))
    db.connection.commit()
    flash('Rifa creada')
    return redirect('/sRifa')

@spendyApp.route('/uRifa/<int:id>', methods=['GET','POST'])
def uRifa(id):
    anio = request.form['anio']
    premio = request.form['premio']
    descripcion = request.form['descripcion']
    fechaEntrega = request.form['fechaEntrega']
    imag = request.form['imag']

    editarRifa = db.connection.cursor()
    editarRifa.execute("Update rifasanuales SET anio = %s, premio = %s, descripcion = %s, fechaEntrega = %s, imag = %s WHERE id = %s",
                          (anio, premio, descripcion, fechaEntrega, imag, id))
    db.connection.commit()
    flash('Rifa Actualizada')
    return redirect('/sRifa')

@spendyApp.route('/dRifa/<int:id>', methods=['GET','POST']) 
def dRifa(id):
    eliminarRifa = db.connection.cursor()
    eliminarRifa.execute("DELETE FROM rifasanuales WHERE id=%s", (id,))
    db.connection.commit()
    flash('Rifa Eliminada')
    return redirect('/sRifa')

@spendyApp.route("/cInvertir")
def inversiones():
    return render_template("comoInvertir.html")

@spendyApp.route('/Invertir')
def invertir():
    return render_template('invertir.html')


# Iniciar la aplicación
if __name__ == '__main__':
    spendyApp.config.from_object(config['development'])
    spendyApp.run(port=3300)
