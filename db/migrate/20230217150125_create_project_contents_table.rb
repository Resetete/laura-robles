class CreateProjectContentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_tables do |t|
      t.text :title_en
      t.text :title_es
      t.text :title_de

      t.text :description_en
      t.text :description_es
      t.text :description_de

      t.text :music_url
      t.text :image_url

      t.timestamps
    end
  end
end
