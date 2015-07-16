class Event < ActiveRecord::Base
  belongs_to :league
  has_many :results
  has_many :teams, through: :results

  validates :name, :league_id, :location, :starts_at, :occurs_on, presence: true
  validates :name, uniqueness: { scope: :league_id }
end
