class AddImprintContents < ActiveRecord::Migration[7.0]
  def change
    create_table :imprint_contents do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :tax_number
      t.string :copyright_en
      t.string :copyright_de
      t.string :copyright_es

      t.timestamps
    end
  end
end
