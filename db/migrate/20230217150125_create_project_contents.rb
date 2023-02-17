class CreateProjectContents < ActiveRecord::Migration[7.0]
  def change
    create_table :project_contents do |t|
      t.string :title, null: false

      t.text :description_en, null: false
      t.text :description_es, null: false
      t.text :description_de, null: false

      t.string :music_url, null: true
      t.string :image_url, null: true

      t.timestamps
    end
  end
end
