class AddTrivToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :triv, :string
    add_column :films, :obmezh, :string
  end
end
