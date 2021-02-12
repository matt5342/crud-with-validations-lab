class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: %i[artist_name release_year]}
    # validates :released, inclusion: ([false])
    validates :release_year, presence: true, 
                            if: self.release_year <= Time.now.year,
                            unless: self.released == false
                            # end

    # validates :release_year, length: {maximum: Time.now.year}
end
