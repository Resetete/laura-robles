class CreateVideoPlayerContents < ActiveRecord::Migration[7.0]
  def change
    create_enum :video_instrument, ['cajon', 'bass']
    
    create_table :video_player_contents do |t|
      t.string :video_url
      t.enum :instrument, enum_type: :video_instrument, null: false

      t.timestamps
    end
  end
end
