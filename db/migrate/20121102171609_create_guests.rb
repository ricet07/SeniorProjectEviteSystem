class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.integer :event_id
      t.boolean :alreadyEmailed
      t.string :rsvp
      t.integer :event_id

      t.timestamps
    end
  end
end
