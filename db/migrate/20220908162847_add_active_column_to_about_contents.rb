class AddActiveColumnToAboutContents < ActiveRecord::Migration[7.0]
  def change
    add_column :about_contents, :active, :boolean
  end
end
