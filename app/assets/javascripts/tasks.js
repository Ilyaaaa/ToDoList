$(function() {
    $('#create_task').on('ajax:success', function(e, data, status, xhr) {
        if(data.errors.length == 0){
            $('#tasks').append(data.task_html);
        }
        
        $('#errors').empty()
        for (var num in data.errors)
            $('#create_errors').append(data.errors[num])

    }).on ('ajax:error', function(e, xdr, status, error) {
        console.log(xdr.responseText)
    });
});

function create_task_html(task) {

}
