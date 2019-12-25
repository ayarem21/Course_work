class AddFormatToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :format, :string
  end
end
