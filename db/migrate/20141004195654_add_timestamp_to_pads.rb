class AddTimestampToPads < ActiveRecord::Migration
  def change
    add_column :pads, :timestamp, :timestamp
  end
end
