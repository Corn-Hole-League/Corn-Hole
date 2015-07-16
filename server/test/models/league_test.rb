require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  def setup
    @league = leagues(:one)
  end

  test "the fixture is valid" do
    assert @league.valid?
  end

  test "is invalid without name" do
    @league.name = nil
    refute @league.valid?
    assert @league.errors.keys.include?(:name)
  end

  test "responds to teams" do
    assert_respond_to @league, :teams
  end

  test "responds to events" do
    assert_respond_to @league, :events
  end
end
