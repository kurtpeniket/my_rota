class AddTokenToCongregation < ActiveRecord::Migration[6.1]
  def change
    add_column :congregations, :token, :string
  end
end
