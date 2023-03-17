class RenameColumnMusicUrlProjectContents < ActiveRecord::Migration[7.0]
  def change
    rename_column :project_contents, :music_url, :musicians
  end
end
