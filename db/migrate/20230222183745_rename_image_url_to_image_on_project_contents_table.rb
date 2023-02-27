class RenameImageUrlToImageOnProjectContentsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :project_contents, :image_url, :image
  end
end
