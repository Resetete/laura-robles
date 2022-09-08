class CreateAboutContentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :about_contents do |t|
      t.json :part_1
      t.json :part_2

      t.timestamps
    end
  end
end