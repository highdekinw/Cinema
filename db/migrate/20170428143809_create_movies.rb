class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :time
      t.text :desc

      t.timestamps
    end
  end
end
