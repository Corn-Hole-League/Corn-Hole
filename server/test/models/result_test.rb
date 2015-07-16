require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  def setup
    @result = results(:one)
  end

  test "the fixture is valid" do
    assert @result.valid?
  end

  test "is invalid without event_id" do
    @result.event_id = nil
    refute @result.valid?
    assert @result.errors.keys.include?(:event_id)
  end

  test "is invalid without team_id" do
    @result.team_id = nil
    refute @result.valid?
    assert @result.errors.keys.include?(:team_id)
  end

  test "responds to event" do
    assert_respond_to @result, :event_id
  end

  test "responds to team" do
    assert_respond_to @result, :team_id
  end

end
