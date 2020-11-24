class Shipper < ApplicationRecord
  belongs_to :province
  belongs_to :city
  belongs_to :district

  validates :name, :address, presence: true
  validates :phone_number, presence: true, numericality: true
end
