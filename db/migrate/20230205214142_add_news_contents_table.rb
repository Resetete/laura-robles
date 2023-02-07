class AddNewsContentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :news_contents do |t|
      t.string :title, null: false
      t.datetime :date, null: false
      t.text :content, null: false
      t.string :social_media_permalink

      t.timestamps
    end
  end
end
