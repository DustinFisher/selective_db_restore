class CreateFermentables < ActiveRecord::Migration[6.0]
  def change
    create_table :fermentables do |t|
      t.string :name
      t.string :fermentable_type
      t.boolean :add_after_boil
      t.text :notes

      t.timestamps
    end
  end
end
