class CreateActDates < ActiveRecord::Migration
  def change
    create_table :act_dates do |t|
      t.datetime :date
      t.integer :act_id

      t.timestamps
    end
  end
end
