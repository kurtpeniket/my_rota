class CreateRotas < ActiveRecord::Migration[6.1]
  def change
    create_table :rotas do |t|
      t.string :month

      t.timestamps
    end

    create_table :meetings do |t|
      t.date :date

      t.timestamps
    end

    add_reference :meetings, :rota

  end
end
