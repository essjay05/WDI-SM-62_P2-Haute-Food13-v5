class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image_uri
      t.string :vendor
      t.string :vendor_loc
      t.string :tag

      t.timestamps
    end
  end
end
