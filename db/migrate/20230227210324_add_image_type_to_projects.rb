class AddImageTypeToProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :project_contents, :image, :image_white
    add_column :project_contents, :image_black, :string
  end
end
