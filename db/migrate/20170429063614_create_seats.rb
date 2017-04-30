class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.integer :x
      t.integer :y
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
