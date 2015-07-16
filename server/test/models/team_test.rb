require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = teams(:one)
  end

  test "the fixture is valid" do
    assert @team.valid?
  end

  test "is invalid without a name" do
    @team.name = nil
    refute @team.valid?
    assert @team.errors.keys.include?(:name)
  end

  test "is invalid without a ranking" do
    @team.ranking = nil
    refute @team.valid?
    assert @team.errors.keys.include?(:ranking)
  end

  test "is invalid without a league id" do
    @team.league_id = nil
    refute @team.valid?
    assert @team.errors.keys.include?(:league_id)
  end

  test "cannot have duplicate team names within a league" do
    team = Team.new(name: "Test Team", league_id: 1)
    refute team.valid?
    assert team.errors.keys.include?(:name)
  end

  test "responds to league" do
    assert_respond_to @team, :league
  end

  test "responds to results" do
    assert_respond_to @team, :results
  end

  test "responds to events" do
    assert_respond_to @team, :events
  end

end
