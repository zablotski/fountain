class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user
      t.string :name
      t.text :description
      t.string :url
      t.string :filter

      t.timestamps
    end
    add_index :photos, :user_id
  end
end
