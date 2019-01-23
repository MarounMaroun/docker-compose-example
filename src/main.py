import json

from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

@app.route('/hello')
def get_es_greeting():
    r = requests.get('http://elasticsearchDB:9200')
    return json.dumps(r.json())


if __name__ == '__main__':
    app.run(host='0.0.0.0')
