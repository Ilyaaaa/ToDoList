json.task_id @task.id
json.task_html render @task
json.errors @errors do |error|
    json.alert render partial: "layouts/error.html.erb", locals: {error: error}, :layout => false
end