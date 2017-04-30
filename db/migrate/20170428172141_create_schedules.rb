class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :stime
      t.decimal :price
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
