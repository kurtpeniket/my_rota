class CreateCongregations < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :display_name

      t.timestamps
    end

    create_table :congregations do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end

    create_table :user_role_congregations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.references :congregation, null: false, foreign_key: true

      t.timestamps
    end

    add_column :users, :super_admin, :boolean, default: false
  end
end
