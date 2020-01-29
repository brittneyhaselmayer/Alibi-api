class Event < ApplicationRecord
  has_many :meetups
  has_many :alibis, through: :meetups
  has_many :pendings
  has_many :alibis, through: :pendings
end
