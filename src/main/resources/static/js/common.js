function redirectChat() {
    window.location.replace("/chat");
}
function redirectUsers() {
    window.location.replace("/users");
}
function redirectFlats() {
    window.location.replace("/flats");
}
function showAddBlock() {
    $("#flat-id").val();
    $("#amount-room").val("");
    $("#average-mark").val("");
    $("#month-price").val("");

    $("#form-update").hide();
    $("#form-show").hide();
    $("#form-add").append(
        "<label for='amount-room' class='col-2 col-form-label'>" +
        "Количество комнат" +
        "<input id='amount-room' name='amount-room' class='form-control'" +
        "type='text' placeholder='Количество комнат' pattern='^[0-9]+$'/>" +
        "</label><br/><label for='average-mark' class='col-2 col-form-label'>Оценка " +
        "<input id='average-mark' name='average-mark' class='form-control' " +
        "type='text' placeholder='Оценка' pattern='[1-9]'/> " +
        "</label><br/> " +
        "<label for='month-price' class='col-2 col-form-label'>Цена за месяц " +
        "<input id='month-price' name='month-price' class='form-control'" +
        "type='text' placeholder='Цена за месяц' pattern='^[0-9]+$'/>" +
        "</label><br/>" +
        "<button class='btn btn-default' onclick='addFlat()'>Добавить</button>"
    );
    $("#form-add").show();
}
function addFlat() {
    flat.amountRoom = $('#amount-room').val();
    flat.averageMark = $('#average-mark').val();
    flat.monthPrice = $('#month-price').val();
    $.ajax({
        url: "/flats/save",
        contentType: "application/json; charset=utf-8",
        type: "POST",
        data: JSON.stringify(flat),
        dataType: "json",
        success: function (idFlat) {
            window.location.replace("/flats/" + idFlat);
        },
        error: function (error) {
            alert("ошибка добавления");
        }
    });
}
function getFlats() {
    window.location.replace("/flats");
}