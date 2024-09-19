from flask import Flask,render_template,url_for, request, redirect
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
import datetime

spendyApp = Flask(__name__)  
db        = MySQL(spendyApp)

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
        fechaReg = datetime.datetime()
        regUsuario = db.connection.cursor()
        regUsuario.execute("INSERT INTO usuario (nombre, correo, clave, fechareg) VALUES(%s,%s,%s,%s)",(nombre, correo,claveCifrada,fechaReg))
        db.connection.commit()
        return render_template('home.html')
    else:
        return render_template('signup.html')

@spendyApp.route('/signin')
def signin():
    return render_template('signin.html')

if __name__ == '__main__':
    spendyApp.run(port=3300,debug=True)
    
