class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.text :description
      t.string :clasification
      t.decimal :price
      t.datetime :date

      t.timestamps
    end
  end
end
