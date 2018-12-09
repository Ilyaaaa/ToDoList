class Task < ApplicationRecord
    validates :title, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "contains special characters" }
    validates :description, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "contains special characters" }, allow_blank: true
    validates :priority, presence: true, numericality: { only_integer: true }
    validates :due_date, presence: true
end
