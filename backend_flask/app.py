#performing flask imports
from flask import Flask,jsonify


app = Flask(__name__) #intance of our flask application 

#Route '/' to facilitate get request from our flutter app
@app.route('/', methods = ['GET'])
def index():
    return jsonify({'greetings' : 'Test API from Flask','greetings2' : 'Afiq Ahmad Khairuddin Signing OFF'}) #returning key-value pair in json format


if __name__ == "__main__":
    app.run(debug = True) #debug will allow changes without shutting down the server 
