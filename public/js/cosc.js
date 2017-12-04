$(document).ready(function () {
    $('#province').on('change', function () {
        $.getJSON("http://localhost/cosc4806/app/util/city.php", {province_name: $(this).val()}, function (data) {
            alert("IN");
            var options = '';
            for (var x = 0; x < data.length; x++) {
                options += '<option value="' + data[x]['id'] + '">' + data[x]['name'] + '</option>';
            }
            $("#city").html(options);
        });
    });

    $('#staff').on('click', function () {
        $('#managedByDiv').show();
    });

    $('#manager').on('click', function () {
        $('#managedByDiv').hide();
    });

    /*
    $('#name').blur(function () {
        $('#clientlist tr').each(function () {
            var clientName = '' + $(this).find("td").eq(1).html();
            var value = '' + $('#name').val();
            if (value.toLowerCase() == clientName.toLowerCase()) {
                alert("Client name exists!")
                $('#name').val('');
            }
        });
    });
    */
});


