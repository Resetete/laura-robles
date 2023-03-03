class AddAudioToProjectContentsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :project_contents, :audio_file, :string
  end
end
