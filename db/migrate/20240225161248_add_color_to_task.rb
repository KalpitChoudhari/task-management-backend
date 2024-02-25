class AddColorToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :color, :string, default: "#F4F4F4"
  end
end
