from flask import Flask, request, render_template, jsonify, redirect, url_for
import datetime

app = Flask(__name__)

# In-memory storage for demo
students = [
    {"id": "12225252", "name": "John Doe", "course": "Software Engineering"},
    {"id": "12225260", "name": "Jane Smith", "course": "Computer Science"}
]

@app.route("/")
def main():
    return render_template("index.html")

@app.route("/students")
def get_students():
    return render_template("students.html", students=students)

@app.route("/api/students")
def api_students():
    return jsonify(students)

@app.route("/student/<student_id>")
def get_student(student_id):
    student = next((s for s in students if s["id"] == student_id), None)
    if student:
        return render_template("student.html", student=student)
    return "Student not found", 404

@app.route("/add-student", methods=["GET", "POST"])
def add_student():
    if request.method == "POST":
        new_student = {
            "id": request.form["id"],
            "name": request.form["name"],
            "course": request.form["course"]
        }
        students.append(new_student)
        return redirect(url_for("get_students"))
    return render_template("add_student.html")

@app.route("/health")
def health_check():
    return jsonify({
        "status": "healthy",
        "timestamp": datetime.datetime.now().isoformat(),
        "students_count": len(students)
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5050, debug=True)