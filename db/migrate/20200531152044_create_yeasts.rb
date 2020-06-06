class CreateYeasts < ActiveRecord::Migration[6.0]
  def change
    create_table :yeasts do |t|
      t.string :name
      t.string :yeast_type
      t.string :form
      t.text :notes

      t.timestamps
    end
  end
end
