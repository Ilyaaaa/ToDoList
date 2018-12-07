json.array! @errors do |error|
    json.alert render partial: "layouts/error.html.erb", locals: {error: error}, :layout => false
end