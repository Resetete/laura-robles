class DropRedundantFileAttachmentColumnsProjectContentsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :project_contents, :image_white
    remove_column :project_contents, :image_black
    remove_column :project_contents, :audio_file
  end
end
