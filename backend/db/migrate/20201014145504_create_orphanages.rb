class CreateOrphanages < ActiveRecord::Migration[6.0]
  def change
    create_table :orphanages do |t|
      t.string  :name
      t.decimal :latitude, precision: 10, scale: 2
      t.decimal :longitude, precision: 10, scale: 2
      t.string  :about
      t.string  :instructions
      t.string  :opening_hours
      t.boolean :open_on_weekend
      t.timestamps
    end
  end
end
