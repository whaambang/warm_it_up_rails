class AddPhotosToPosses < ActiveRecord::Migration
  def change
    add_column :posses, :image_url, :string
  end
end
