class Song < ApplicationRecord
validates :title, presence: true
validates :title, uniqueness: {scope: :release_year}
validates :released, null: false
validates :release_year, presence: true, if: :is_released 
validate :not_future

    def is_released
        self.released == true
    end

    def not_future
        if self.release_year && self.release_year > DateTime.now.year 
            errors.add(:release_year, "cannot be in the future")
        end
    end
end
