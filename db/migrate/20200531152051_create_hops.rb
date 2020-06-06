class CreateHops < ActiveRecord::Migration[6.0]
  def change
    create_table :hops do |t|
      t.string :name
      t.float :alpha
      t.string :form
      t.text :notes

      t.timestamps
    end
  end
end
