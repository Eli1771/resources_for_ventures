class Course < ApplicationRecord
  has_many :materials
  has_many :users

  def fileify
    self.name.downcase.split(" ").join("-")
  end
end
