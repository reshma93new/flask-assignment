from flask import Flask
import os

app = Flask(__name__)

LICENSE = os.environ.get("LICENSE_KEY")

@app.route('/')
def hello_world():
    return LICENSE

if __name__ == '__main__' and LICENSE!=None:
    PORT = int(os.environ.get('PORT', 8096))
    app.run(host="0.0.0.0", port=PORT, debug=True)