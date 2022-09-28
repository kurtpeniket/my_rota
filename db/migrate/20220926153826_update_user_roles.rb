class UpdateUserRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :audio, :string
    add_column :meetings, :video, :string
    add_column :meetings, :attendant, :string
    add_column :meetings, :left_mic, :string
    add_column :meetings, :right_mic, :string
    add_column :meetings, :platform, :string
    add_column :meetings, :notes, :string
  end
end
