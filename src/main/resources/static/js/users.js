var student = {};
var command;
class User {
    constructor(data) {
        if (typeof data.id === "undefined") {
            this.id = 0;
        } else {
            this.id = data.id;
        }
        this.username = data.username;
        this.password = data.password;
        this.enabled = data.enabled;
    };

    toString() {
        return "id: " + this.id + " username: " + this.username+ " password: " + this.password+ " enabled: " + this.enabled;
    }
}
function showAddForm() {
    command = "addstudent";
    $("#name").val("");
    $("#surname").val("");
    $("#averageMark").val("");
    $("#form-add-update").css("display", "block");
}
function submitStudent() {
    if(command==="addstudent"){
        student.id = 0;
    }
    student.name = $('#name').val();
    student.surname = $('#surname').val();
    student.averageMark = $('#averageMark').val();
    $.ajax({
        url: "controller?command="+command,
        contentType: "application/json; charset=utf-8",
        type: "POST",
        data: student,
        dataType: "text",
        success: [function (success) {
            alert(success);
        }],
        error: [function (error) {
            alert(error);
        }]
    })
}
function getStudent(id) {
    $.ajax({
        url: "controller?command=getstudent&id=" + id,
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        success: [function (result) {
            var student = new Student(result);
            $("#result-data").html(student.toString());
            $("#result").css("display", "block");
        }],
        dataType: "json",
        error: [function (error) {
            alert("error");
        }]
    });
}
function updateStudents() {
    window.location.replace("controller?command=getstudents");
}
function deleteStudent(studentId) {
    $.ajax({
        url: "users/delete/" + studentId,
        contentType: "application/json; charset=utf-8",
        type: "POST",
        success: [function (success) {
            alert("Успех");
        }],
        error: [function (error) {
            alert("error");
        }]
    });
}
function showUpdateForm(userId, userUsername, userPassword, userEnabled) {
    command = "updateStudent";
    user.id = userId;
    $("#name").val(userUsername);
    $("#surname").val(userPassword);
    $("#averageMark").val(userEnabled);
    $("#form-add-update").css("display", "block");
}