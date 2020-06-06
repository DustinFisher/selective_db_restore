class CreateMiscs < ActiveRecord::Migration[6.0]
  def change
    create_table :miscs do |t|
      t.string :name
      t.string :misc_type
      t.string :use
      t.text :notes

      t.timestamps
    end
  end
end
