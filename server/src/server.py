#!/usr/bin/env python3

from flask import Flask, request
from time import sleep

app = Flask(__name__)

@app.route('/', methods=['GET'])
@app.route('/mitmproxy', methods=['GET'])
def home():
    time = request.args.get('time')
    if time is not None:
        time = int(time)
        sleep(time)
        return 'You have successfully bypass the IDS!\n'
    return 'You have successfully bypass the IDS!\n'

@app.route('/mit', methods=['GET'])
def mit():
    time = request.args.get('time')
    if time is not None:
        time = int(time)
        sleep(time)
        return 'You have successfully seen the mitmproxy!\n'
    return 'You have successfully seen the mitmproxy!\n'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=None)
