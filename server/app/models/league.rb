class League < ActiveRecord::Base
  has_many :teams
  has_many :events

  validates :name, presence: true
end
