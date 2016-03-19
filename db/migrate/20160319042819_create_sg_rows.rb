class CreateSgRows < ActiveRecord::Migration
  def change
    create_table :sg_rows do |t|
      t.string :name
      t.integer :number_seats
      t.integer :section_id
      t.integer :venue_id
      t.integer :sg_venue_id
      t.integer :sg_db_venue_id
      t.integer :x_offset
      t.integer :y_offset

      t.timestamps
    end
  end
end