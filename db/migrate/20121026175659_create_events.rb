class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :eventType
      t.string :hostName
      t.string :phoneNum
      t.string :location
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :description
      t.boolean :potluck
      t.string :image
      t.integer :user_id
      t.string  :rsvp_choices
      t.boolean :guestlist_privacy
      t.string  :guestPass
      t.string :hostEmail
      t.string :date
      t.string :time
      t.timestamps

    end
  end
end
