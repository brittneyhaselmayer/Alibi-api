class Alibi < ApplicationRecord
  belongs_to :user

  has_many :meetups
  has_many :events, through: :meetups
  has_many :pendings
  has_many :events, through: :pendings
end
