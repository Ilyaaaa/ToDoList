class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user
      t.string :title
      t.text :description
      t.integer :priority
      t.date :due_date
      t.boolean :complited => {:default => false}

      t.timestamps
    end
  end
end
