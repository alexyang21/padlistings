class CreatePads < ActiveRecord::Migration
  def change
    create_table :pads do |t|
      t.string :heading
      t.text :body
      t.decimal :price, precision: 8, scale: 2
      t.string :external_url

      t.timestamps
    end
  end
end
