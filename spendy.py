from flask import Flask,render_template,url_for 

spendyApp = Flask(__name__) 

@spendyApp.route('/')
def home():
    return render_template('home.html')

@spendyApp.route('/signup')
def signup():
    return render_template('signup.html')

@spendyApp.route('/signin')
def signin():
    return render_template('signin.html')

if __name__ == '__main__':
    spendyApp.run(port=3300,debug=True)
    
