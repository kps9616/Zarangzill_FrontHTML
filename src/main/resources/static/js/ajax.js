function fn_get(form,apiUrl) {
    $.ajax({
        url: 'http://1.226.83.35:9090/api/v1/'+apiUrl,
        method: 'GET',
        data: $("#"+form).serialize(),
        success: function(response) {
            console.log(response);
            return response;
        },
        error: function(error) {
            console.log(error);
        }
    });
}

function fn_post(form,apiUrl) {
    $.ajax({
        url: 'http://1.226.83.35:9090/api/v1/'+apiUrl,
        method: 'POST',
        data: $("#"+form).serialize(),
        success: function(response) {
            console.log(response);
        },
        error: function(error) {
            console.log(error);
        }
    });
}