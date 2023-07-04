class CreateLocalAuthorities < ActiveRecord::Migration[7.0]
  def change
    create_table :local_authorities do |t|
      t.string :name
      t.geometry :geometry, srid: 27_700

      t.timestamps
    end

    add_index :local_authorities, :geometry, using: :gist
  end
end
