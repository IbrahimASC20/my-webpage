from flask import Flask, send_from_directory

app = Flask(__name__, static_url_path = "")

@app.route("/learn_nations", methods = ["GET"])
def learnNations():
    return send_from_directory(".","BigProject.html")

@app.route("/locations", methods = ["GET"])
def locations():
    return "Hello, World!"

if __name__ == "__main__":
    app.run(debug=True)
