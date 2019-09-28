class Course < ApplicationRecord
  has_many :materials
  has_many :users

  scope :most, -> { joins(:materials).group(:id).order('COUNT(materials.id) DESC') }

  def fileify
    self.name.downcase.split(" ").join("-")
  end
end
