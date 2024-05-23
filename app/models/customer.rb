class Customer < ApplicationRecord
  belongs_to :authentication
  has_many :customer_directions
  has_many :customer_identifications

  validates :client_email, presence: true
  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :tel_number, presence: true 
end
