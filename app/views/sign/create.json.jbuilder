if @errors.size == 0
    json.array! Array.new
else
    json.array! @errors
end