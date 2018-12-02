$(function() {
    $('#sign_up').on('ajax:success', function(e, data, status, xhr) {
        if(data.length == 0){
            window.location.replace("confirm")
            console.log("redirect")
        }
        
        $('#errors').empty()
        for (var num in data)
            $('#errors').append(data[num])

    }).on ('ajax:error', function(e, xdr, status, error) {
        console.log (error)
    });
});
