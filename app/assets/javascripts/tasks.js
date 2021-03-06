$(function() {
    var sortMode = 0;
    sortByPriority();


    $('#task_form').on('ajax:success', function(e, data, status, xhr) {
        if(data.errors.length == 0){
            $("#task" + data.task_id).remove();
            $('#tasks').append(data.task_html);
            sort();
            $('#create_task_modal').modal('toggle');
        }
        
        $('#task_errors').empty();
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


    $('#lists').on('ajax:success', '#completed_form', function(e, data, status, xhr) {
        var taskDiv = $('#task' + data.id);
        taskDiv.find('#completed').prop('checked', data.completed);
        if (data.completed) taskDiv.prependTo($('#completed_tasks'));
        else taskDiv.prependTo($('#tasks'));
        sort();
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
        $('#task_errors').empty();

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
        sort();
    });


    $('#lists').on('click', '#completed', function(event) {
        event.preventDefault();
        $(event.target.form).trigger('submit.rails');
    });


    $('#title_sort_btn').on('click', function() {
        sortByTitle();
    });


    $('#priority_sort_btn').on('click', function() {
        sortByPriority();
    });

    function getAllMarks(){
        return $('*[id*=marked]');
    }

    $('#batch_btn').on('click', function() {
        if (!$(this).hasClass('active')){
            $(this).addClass('active');
            $('#batch_mode').removeClass('invisible');
            getAllMarks().each(function() {
                $(this.form).removeClass('invisible');
            });
        } else{
            $(this).removeClass('active');
            $('#batch_mode').addClass('invisible');
            getAllMarks().each(function() {
                $(this.form).addClass('invisible');
                $(this).prop('checked', false);
            });
        }

    });

    $('#check_btn').on('click', function() {
        getAllMarks().each(function() {
            $(this).prop('checked', true);
        });
    });

    $('#uncheck_btn').on('click', function() {
        getAllMarks().each(function() {
            $(this).prop('checked', false);
        });
    });

    $('#batch_delete_btn').on('click', function() {
        sortByPriority();
        
        var task_id_arr = [];
        getAllMarks().each(function() {
            if ($(this).prop('checked'))
                task_id_arr.push($(this).attr('data-task-id'));
        });

        $.post('tasks/batch_delete', {task_id_arr: JSON.stringify(task_id_arr)})
        .done(function(data) {
            for (var i in data)
                $('#task' + data[i]).remove();
            $('#batch_btn').click();
        });
    });

    function sort(){
        switch(sortMode) {
            case 1: {
                sortByPriority();
                break;
            }

            case 2: {
                sortByTitle();
                break;
            }

            default: {
                sortByPriority();
            }
        }
    }


    function sortByTitle() {
        var titles = [];
        $('*[id*=task_title]').each(function() {
            var card = $(this).parent().parent().parent().parent();
            titles.push([$(this).text(), card, card.parent()]);
        });

        titles.sort(function(a, b) {
            if (a[0] < b[0]) return -1;
            else if (a[0] > b[0]) return 1;
            else return 0;
        });

        for (var num in titles) titles[num][1].appendTo(titles[num][2]);
        sortMode = 2;

    }


    function sortByPriority() {
        var titles = [];
        $('*[id*=task_priority]').each(function() {
            var card = $(this).parent().parent().parent().parent();
            titles.push([$(this).text(), card, card.parent()]);
        });

        titles.sort(function(a, b) {
            return a[0] - b[0];
        });

        for (var num in titles) titles[num][1].appendTo(titles[num][2]);
        sortMode = 1;
    }


    $("#lists").on("mouseenter", ".card-header", function() {
        $(this).find("#edit_task_btn").removeClass("invisible");
        $(this).find("#delete_task").removeClass("invisible");
    });

    $("#lists").on("mouseleave", ".card-header", function() {
        $(this).find("#edit_task_btn").addClass("invisible");
        $(this).find("#delete_task").addClass("invisible");
    });
});
