from flask import Flask,render_template,url_for, request, redirect
from flask_mysqldb import MySQL
from flask_login import LoginManager, login_user, logout_user
from werkzeug.security import generate_password_hash
from models.ModelUser import ModelUser
from models.entities.User import User
import datetime
from config import config

spendyApp = Flask(__name__)  
db        = MySQL(spendyApp)
adminSesion = LoginManager(spendyApp)

@adminSesion.user_loader
def cargaUsuario(id):
    return ModelUser.get_by_id(db, id)

@spendyApp.route('/')
def home():
    return render_template('home.html')

@spendyApp.route('/signup',methods=['GET','POST'])
def signup():
    if request.method == 'POST': 
        nombre = request.form['nombre'] 
        correo = request.form['correo']
        clave  = request.form['clave']
        claveCifrada = generate_password_hash(clave)
        fechaReg = datetime.datetime.now()
        regUsuario = db.connection.cursor()
        regUsuario.execute("INSERT INTO usuario (nombre, correo, clave, fechareg) VALUES(%s,%s,%s,%s)",(nombre, correo,claveCifrada,fechaReg))
        db.connection.commit()
        return render_template('home.html')
    else:
        return render_template('signup.html')

@spendyApp.route('/signin', methods=['GET','POST'])
def signin():
    if request.method == 'POST':
        usuario = User(0, None, request.form['correo'], request.form['clave'], None, None)

        usuarioAutenticado = ModelUser.signin(db, usuario)
        if usuarioAutenticado is not None:
            login_user(usuarioAutenticado)
            if usuarioAutenticado.clave: 
                if usuarioAutenticado.perfil == 'A':
                    return render_template('admin.html')
                else: 
                    return render_template('usuarios.html')
            else:
                return 'CONTRASEÑA INCORRECTA'    
        else:
            return 'USUARIO INEXISTENTE'
    else:
        return render_template('signin.html')

@spendyApp.route('/signout', methods=['GET','POST'])
def signout():
    logout_user() 
    return render_template('home.html')

@spendyApp.route('/sUsuarios', methods=['GET','POST'])
def selUsuario():
    selUsuario = db.connection.cursor()
    selUsuario.execute("SELECT * FROM usuario")
    u = selUsuario.fetchall()
    selUsuario.close
    return render_template('usuarios.html', usuarios = u)

if __name__ == '__main__':
    spendyApp.config.from_object(config['development'])
    spendyApp.run(port=3300)
    
