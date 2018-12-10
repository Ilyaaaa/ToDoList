class Task < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, allow_blank: true
    validates :priority, presence: true, numericality: { only_integer: true }
    validates :due_date, presence: true
end
