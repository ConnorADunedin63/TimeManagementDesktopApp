class AddGoalLabel < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :label, :integer, default: 0
  end
end
