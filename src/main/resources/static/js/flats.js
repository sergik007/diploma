var flat = {};
class Flat {
    constructor(data) {
        this.id=data.id;
        this.amountRoom = data.amountRoom;
        this.averageMark = data.averageMark;
        this.monthPrice = data.monthPrice;
        this.uploadDate = data.uploadDate;
    };

    toString() {
        return "id: " + this.id +
            " amountRoom: " + this.amountRoom +
            " averageMark: " + this.averageMark +
            " monthPrice: " + this.monthPrice +
            " uploadDate: " + this.uploadDate;
    }
}

function showShowBlock() {
    $("#button-update").html('Обновить');
    $("#button-update").attr("onclick", "showUpdateBlock()");
    $("#form-show").show();
    $("#form-add").hide();
    $("#form-update").hide();
}
function showUpdateForm(amountRoom, averageMark, monthPrice) {
    $("#name").val(studentName);
    $("#surname").val(studentSurname);
    $("#averageMark").val(studentAverageMark);
    $("#form-add-update").css("display", "block");
}

function getFlat(id) {
    window.location.replace("/flats/" + id);
}