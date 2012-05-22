class RemoveDateColumnFromActs < ActiveRecord::Migration
  def up
    remove_column :acts, :date
  end

  def down
    add_column :acts, :date, :datetime
  end
end
