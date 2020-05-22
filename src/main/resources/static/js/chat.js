var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#messages").html("");
    getHistory('user3');
}

function connect() {
    var socket = new SockJS('/rent-apartment');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/chat/returnMessage', function (message) {
            showMessage(
                JSON.parse(message.body).content,
                JSON.parse(message.body).usernameFrom,
                JSON.parse(message.body).date,
                JSON.parse(message.body).time
            );
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendContent() {
    stompClient.send("/app/saveMessage", {}, JSON.stringify(
        {
            'content': $("#content").val(),
            'usernameTo': 'user3'
        }
    ));
    deleteInputContent();

}

function getHistory(userLogin) {
    $.ajax({
        url: "/chat/getHistory/"+userLogin,
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        success: function (history) {
            $.each(history, function (id, data) {
                var content = data.content;
                var usernameFrom = data.usernameFrom;
                var date = data.date;
                var time = data.time;
                showMessage(content, usernameFrom, date, time);
            });
        },
        dataType: "json",
        error: [function (error) {
            alert("error");
        }]
    });
}

function showMessage(content, usernameFrom, date, time) {
    $("#messages").append("<tr><td>" + content + "</td>" +
        "<td>" + usernameFrom + "</td>" +
        "<td>" + date + "</td>" +
        "<td>" + time + "</td></tr>");
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $("#connect").click(function () {
        connect();
    });
    $("#disconnect").click(function () {
        disconnect();
    });
    $("#send").click(function () {
        sendContent();
    });
});
function deleteInputContent() {
    $("#content").val('');
}
