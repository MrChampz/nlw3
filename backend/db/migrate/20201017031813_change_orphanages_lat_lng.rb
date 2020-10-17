class ChangeOrphanagesLatLng < ActiveRecord::Migration[6.0]
  def change
    change_table :orphanages do |t|
      t.change :latitude, :decimal, precision: 12, scale: 10
      t.change :longitude, :decimal, precision: 12, scale: 10
    end
  end
end
