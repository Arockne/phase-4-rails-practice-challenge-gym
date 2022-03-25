class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :charge, numericality: true
  validates :gym_id, uniqueness: { scope: :client_id}
end
