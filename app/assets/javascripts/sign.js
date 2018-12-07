$(function() {
    $('#sign_in').on('ajax:success', function(e, data, status, xhr) {
        if(data.length == 0)
            window.location.replace("")
        
        $('#errors').empty()
        for (var num in data)
            $('#errors').append(data[num].alert)

    }).on ('ajax:error', function(e, xdr, status, error) {
        console.log(xdr.responseText)
        console.log(error)
    });

    $('#sign_up').on('ajax:success', function(e, data, status, xhr) {
        if(data.length == 0)
            window.location.replace("confirm")
        
        $('#errors').empty()
        for (var num in data)
            $('#errors').append(data[num].alert)

    }).on ('ajax:error', function(e, xdr, status, error) {
        console.log(xdr.responseText)
    });
});
