var flag=0;
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

function setFlat(){
    flat.id = $('#flat-id').text();
    flat.amountRoom = $('#flat-amount-room').text();
    flat.averageMark = $('#flat-average-mark').text();
    flat.monthPrice = $('#flat-month-price').text();
}

window.onload = function () {
    setFlat();
}

function showUpdateBlock() {
    $('#flat-id').val();
    $('#amount-room').val("");
    $('#average-mark').val("");
    $('#month-price').val("");
    $('#street').val("");
    $('#house-number').val("");
    $('#flat-number').val("");

    $('#button-update').html('Показать');
    $('#button-update').attr("onclick", "showShowBlock()");

    $('#form-show').hide();
    $('#form-add').hide();
    if (flag == 0) {
        $('#form-update').append("" +
            "<input id='flat-id' name='flat-id' class='form-control' required='true'type='hidden'/> " +
            "<label for='flat-amount-room' class='col-2 col-form-label'>Количество комнат " +
            "<input id='flat-amount-room' name='amount-room' class='form-control' required='true' type='text' placeholder='Количество комнат' pattern='^[0-9]+$'/></label><br/>" +
            "<label for='flat-average-mark' class='col-2 col-form-label'>Оценка" +
            "<input id='flat-average-mark' name='average-mark' class='form-control' required='true' type='text' placeholder='Оценка' pattern='[1-9]'/></label><br/>" +
            "<label for='flat-month-price' class='col-2 col-form-label'>Цена за месяц" +
            "<input id='flat-month-price' name='month-price' class='form-control' required='true' type='text' placeholder='Цена за месяц' pattern='^[0-9]+$'/></label><br/>" +
            "<div class='flat-form-update-address'>" +
            "<label for='flat-street' class='col-2 col-form-label'>Улица " +
            "<input id='flat-street' name='month-price' class='form-control' required='true' type='text' placeholder='Улица' pattern=''^[0-9]+$'/></label><br/> " +
            "<label for='flat-house-number' class='col-2 col-form-label'>Номер дома" +
            "<input id='flat-house-number' name='month-price' class='form-control' required='true' type='text' placeholder='Номер дома' pattern='^[0-9]+$'/></label><br/>" +
            "<label for='flat-flat-number' class='col-2 col-form-label'>Квартира" +
            "<input id='flat-flat-number' name='month-price' class='form-control' required='false' type='text' placeholder='Номер дома' pattern='^[0-9]+$'/> </label><br/></div>" +
            "<button class='btn btn-default' onclick='updateFlat()'>Обновить</button>");
        flag = 1;
    }

    $('#form-update').show();

    $('#flat-id').val(flat.id);
    $('#flat-amount-room').val(flat.amountRoom);
    $('#flat-average-mark').val(flat.averageMark);
    $('#flat-month-price').val(flat.monthPrice);
}

function showShowBlock() {
    $("#button-update").html('Обновить');
    $("#button-update").attr("onclick", "showUpdateBlock()");
    $("#form-show").show();
    $("#form-add").hide();
    $("#form-update").hide();
}

function deleteFlat() {
    var confident = confirm("Вы - уверены?");
    if (confident == true) {
        $.post(
            "/flats/delete/" + flat.id,
            function (data){
                window.location.replace("/flats");
            }
        );
        //window.location.replace("/flats/delete/" + flat.id);
    }
}
function deleteImage(imageId) {

}
function updateFlat() {
    flat.id = $('#flat-id').val();
    flat.amountRoom = $('#flat-amount-room').val();
    flat.averageMark = $('#flat-average-mark').val();
    flat.monthPrice = $('#flat-month-price').val();
    $.ajax({
        url: "/flats/update",
        contentType: "application/json; charset=utf-8",
        type: "POST",
        data: JSON.stringify(flat),
        dataType: "json",
        success: function (flatId) {
            window.location.replace("/flats/" + flatId);
        },
        error: function (error) {
            alert("ошибка обновления");
        }
    });
}
