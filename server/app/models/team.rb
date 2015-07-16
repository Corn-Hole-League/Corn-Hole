class Team < ActiveRecord::Base
  belongs_to :league
  has_many :results
  has_many :events, through: :results

  validates :name, :ranking, :league_id, presence: true
  validates :name, uniqueness: { scope: :league_id }
end
