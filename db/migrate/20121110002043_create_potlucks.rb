class CreatePotlucks < ActiveRecord::Migration
  def change
    create_table :potlucks do |t|
      t.integer :event_id
      t.string :item
      t.integer :guest_id

      t.timestamps
    end
  end
end
