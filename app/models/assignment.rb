class Assignment < ApplicationRecord
  belongs_to :material
  belongs_to :user

  def default_values
    if self.viewed.nil?
      self.viewed = false
    end
  end 
end
