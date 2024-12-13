from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}/{os.getenv('DB_NAME')}"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Submission(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    message = db.Column(db.Text, nullable=False)

with app.app_context():
    db.create_all()

@app.route('/submit', methods=['POST'])
def submit_form():
    data = request.json
    submission = Submission(name=data['name'], email=data['email'], message=data['message'])
    db.session.add(submission)
    db.session.commit()
    return jsonify({"message": "Form submitted successfully"}), 201

@app.route('/submissions', methods=['GET'])
def get_submissions():
    submissions = Submission.query.all()
    results = [{"id": s.id, "name": s.name, "email": s.email, "message": s.message} for s in submissions]
    return jsonify(results), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)