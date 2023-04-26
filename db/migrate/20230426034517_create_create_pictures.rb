class CreateCreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :create_pictures do |t|
      t.text :image, null: false
      t.text :content
      t.timestamps
    end
  end
end
