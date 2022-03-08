from flask import Flask

import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<p>DOR3 Hello from PY in Docker !</p>' + os.environ["INFOSHARE"]
