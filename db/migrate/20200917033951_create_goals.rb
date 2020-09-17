class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.datetime :end_date
      t.string :tasks, array: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
