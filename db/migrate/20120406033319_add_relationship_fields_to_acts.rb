class AddRelationshipFieldsToActs < ActiveRecord::Migration
  def change
    add_column :acts, :theater_id, :integer
    add_column :acts, :venue_id, :integer

  end
end
