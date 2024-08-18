class Stable < ApplicationRecord
  belongs_to :address
  has_many :horses
  
  accepts_nested_attributes_for :address
  validates_associated :address
end
