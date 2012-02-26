class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
