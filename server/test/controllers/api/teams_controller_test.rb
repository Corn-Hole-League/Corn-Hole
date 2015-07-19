require 'test_helper'

class Api::TeamsControllerTest < ActionController::TestCase
  def setup
    @league = leagues(:one)
    @event = events(:one)
    @teams = Team.all
    @team = @league.teams.create!(name: 'Teamie McTeam')
    @attributes = Team.attribute_names
  end

  test 'creates with valid attribute' do
    assert_difference('Team.count', 1) do
      post :create, format: :json, league_id: @league, team: { name: 'TeamBoBerry' }
    end
    assert_response :success
  end

  test 'does not create with invalid attribute' do
    assert_no_difference('Team.count') do
      post :create, format: :json, league_id: @league, team: { name: '' }
    end
    assert_response 422
  end

  test 'GET #show' do
    get :show, format: :json, league_id: @league, id: @team
    returned = JSON.parse(response.body, symbolize_names: true)
    @attributes.each do |attr|
      if @team.send(attr).class == ActiveSupport::TimeWithZone
        assert_equal @team.send(attr).to_s, returned[attr.to_sym].to_time.utc.to_s
      else
        assert_equal expected = @team.send(attr), returned[attr.to_sym]
      end
    end
    assert_response :success
  end

  test 'updates with valid attributes' do
    patch :update, format: :json, league_id: @league, id: @team, team: { name: 'Oh Hai' }
  end

  test 'does not update with invalid attributes' do
    patch :update, format: :json, league_id: @league, id: @team, team: { name: '' }
    assert_response 422
  end

  test 'DELETE #destroy' do
    assert_difference('Team.count', -1) do
      post :destroy, league_id: @league, format: :json, id: @team
    end
    assert_response :success
  end

  test 'can join an event (has result with no score)' do
    assert_difference('Result.count', 1) do
      @team.events << @event
    end
    assert @team.events.include?(@event)
  end

  test 'cannot join the same event twice' do
    @team.events << @event
    assert_raises(ActiveRecord::RecordInvalid) do
      @team.events << @event
    end
  end

  test 'can join multiple events in single update' do
    @event2 = events(:two)
    assert_difference('Result.count', 2) do
      @team.events << @event
      @team.events << @event2
    end
    assert @team.events.include?(@event)
    assert @team.events.include?(@event2)
  end

end
