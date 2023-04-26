class CreateCreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :create_pictures do |t|

      t.timestamps
    end
  end
end
