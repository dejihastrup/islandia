class Island < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many_attached :photos
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { in: 200_000..1_000_000 }
  validates :location, presence: true
  validates :squarekm, presence: true, numericality: { in: 30_000..200_000 }
  validates :number_of_villas, presence: true, numericality: { in: 10..50 }
  validates :guests, presence: true, numericality: { in: 10..200 }
  validates :butlers, presence: true, numericality: { in: 5..60 }
  validates :yachts, presence: true, numericality: { in: 5..20 }
end
