class Assignment < ApplicationRecord
  belongs_to :material
  belongs_to :user

  before_save :default_values

  def default_values
    if self.viewed.nil?
      self.viewed = false
    end
  end
end
