require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = events(:one)
  end

  test "the fixture is valid" do
    assert @event.valid?
  end

  test "is invalid without name" do
    @event.name = nil
    refute @event.valid?
    assert @event.errors.keys.include?(:name)
  end

  test "is invalid without location" do
    @event.location = nil
    refute @event.valid?
    assert @event.errors.keys.include?(:location)
  end

  test "is invalid without league_id" do
    @event.league_id = nil
    refute @event.valid?
    assert @event.errors.keys.include?(:league_id)
  end

  test "is invalid without occurs_on" do
    @event.occurs_on = nil
    refute @event.valid?
    assert @event.errors.keys.include?(:occurs_on)
  end

  test "is invalid without starts_at" do
    @event.starts_at = nil
    refute @event.valid?
    assert @event.errors.keys.include?(:starts_at)
  end

  test "cannot have duplicate event names, scoped to a league" do
    event = Event.new(name: "Cornhole: TDM",
                      location: 'here',
                      league_id: 1,
                      occurs_on: 2015-01-31,
                      starts_at: '13:57:00')
    refute event.valid?
    assert event.errors.keys.include?(:name)
  end

  test "responds to league" do
    assert_respond_to @event, :league
  end

  test "responds to results" do
    assert_respond_to @event, :results
  end

  test "responds to teams" do
    assert_respond_to @event, :teams
  end

end
