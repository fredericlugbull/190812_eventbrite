class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User'

  validates :start_date,
    presence: true,
    numericality: { greater_than_or_equal_to: Time.now.to_i }

  validates :duration,
      presence: true,
      numericality: { greater_than: 0, only_integer: true}

  validates :title,
      presence: true,
      length: { in: 6..20 }

  validates :description,
      presence: true,
      length: { in: 20..1000 }

  validates :price,
      presence: true,
      length: { in: 1..1000}

  validates :location,
      presence: true

end
