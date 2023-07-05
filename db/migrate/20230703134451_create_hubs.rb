class CreateHubs < ActiveRecord::Migration[7.0]
  def change
    create_table :hubs do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :phone
      t.string :areas, array: [], default: []

      t.timestamps
    end
  end
end
