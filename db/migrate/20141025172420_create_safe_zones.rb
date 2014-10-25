class CreateSafeZones < ActiveRecord::Migration
  def change
    create_table :safe_zones do |t|
      t.string :location_name
      t.string :person_name
      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
