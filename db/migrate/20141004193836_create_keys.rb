class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
