class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.string :postal_code
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
