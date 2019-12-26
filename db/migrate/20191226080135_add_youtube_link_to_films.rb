class AddYoutubeLinkToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :youtube_link, :string
  end
end
