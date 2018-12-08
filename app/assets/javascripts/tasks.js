$(function() {
    $('#task_form').on('ajax:success', function(e, data, status, xhr) {
        if(data.errors.length == 0){
            $("#task" + data.task_id).remove();
            $('#tasks').append(data.task_html);
            $('#create_task_modal').modal('toggle');
        }
        
        $('#errors').empty();
        for (var num in data.errors)
            $('#task_errors').append(data.errors[num].alert);

    }).on ('ajax:error', function(e, xdr, status, error) {
        console.log(xdr.responseText);
    });

    $('a#delete_task').on('ajax:success', function(e, data, status, xhr) {
        $("#task" + data.id).remove();
    }).on ('ajax:error', function(e, xdr, status, error) {
        console.log(xdr.responseText);
    });

    $('#create_task_modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);

        var form = $('#task_form');
        var title = $('#task_form_title');
        var desc = $('#task_form_desc');
        var priority = $('#task_form_priority');
        var dueDate = $('#task_form_due_date');
        
        form.trigger('reset');

        var header = $('#task_form_header');
        var taskId = button.data('task-id');
        if(taskId == undefined) {
            header.text('Create new task');
            form.attr('action', "tasks/create");
        } else {
            header.text('Edit task');
            form.attr('action', "tasks/" + taskId + "/edit");
            
            $.get("/tasks/" + taskId, function(data) {    
                title.val(data.title);
                desc.val(data.desc);
                priority.val(data.priority);
                dueDate.val(data.due_date);
            });
        }
    });
});
