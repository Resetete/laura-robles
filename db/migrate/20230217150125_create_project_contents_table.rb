class CreateProjectContentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_tables do |t|
      t.string :title

      t.text :description_en
      t.text :description_es
      t.text :description_de

      t.string :music_url
      t.string :image_url

      t.timestamps
    end
  end
end
