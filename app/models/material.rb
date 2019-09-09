class Material < ApplicationRecord
  validates :name, { presence: true }
  validates :url, { presence: true }

  has_many :assignments
  has_many :users, through: :assignments
  belongs_to :course
end
