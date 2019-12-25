class CreateSeances < ActiveRecord::Migration[6.0]
  def change
    create_table :seances do |t|
      t.integer :film_id
      t.string :time
      t.integer :hall_id

      t.timestamps
    end
  end
end
