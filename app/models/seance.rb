class Seance < ApplicationRecord
  belongs_to :film

  def self.search(search)
    #where("#{Film.find(@film.film_id).name} LIKE ?", "%#{search}%")
    Film.find(@seances.film_id).seances.joins(:films => :f).where("f.name LIKE ?", "%#{search}%")

  end

end
