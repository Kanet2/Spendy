from flask import Flask,render_template,url_for 

spendyApp = Flask(__name__) 

@spendyApp.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    spendyApp.run(port=3300,debug=True)
    