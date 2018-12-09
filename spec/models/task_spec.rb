require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with valid attributes" do
    task = Task.new
    task.title = "title"
    task.priority = 2
    task.due_date = Date.tomorrow
    expect(task).to be_valid
  end

  it "is not valid without a title"  do
    task = Task.new
    task.priority = 2
    task.due_date = Date.tomorrow
    expect(task).to_not be_valid
  end

  it "is not valid without a due_date" do
    task = Task.new
    task.title = "title"
    task.priority = 2
    expect(task).to_not be_valid
  end

  it "is not valid without a priority" do
    task = Task.new
    task.title = "title"
    task.due_date = Date.tomorrow
    expect(task).to_not be_valid
  end
end
