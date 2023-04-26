class ChangeCreatePicturesToPicrures < ActiveRecord::Migration[6.1]
  def change
    rename_table :create_pictures, :pictures
  end
end
