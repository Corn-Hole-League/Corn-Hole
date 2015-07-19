require 'test_helper'

class Api::EventsControllerTest < ActionController::TestCase
  def setup
    @league = leagues(:one)
    @events = Event.all
    @event = events(:one)
    @team = teams(:one)
    @attributes = Event.attribute_names
  end

  test "GET #index" do
    get :index, format: :json

    returned = JSON.parse(response.body, symbolize_names: true)[0]
    @attributes.each do |attr|
      @event.send(attr).class == Date ? expected = @event.send(attr).to_s : expected = @event.send(attr)
      assert_equal expected, returned[attr.to_sym]
    end
    assert_response :success
  end

  test 'creates with valid attribute' do
    assert_difference('Event.count', 1) do
      post :create, format: :json, event: { name: 'Events are cool',
                    league_id: @league.id,
                    location: 'Ici',
                    occurs_on: '2015-07-31',
                    starts_at: '15:31:12' }
    end
    assert_response :success
  end

  test 'does not create with invalid attribute' do
    assert_no_difference('Event.count') do
      post :create, format: :json, event: { name: '',
                    league_id: @league.id,
                    location: 'Ici',
                    occurs_on: '2015-07-31',
                    starts_at: '15:31:12' }
    end
    assert_response 422
  end

  test 'GET #show' do
    get :show, format: :json, id: @event
    returned = JSON.parse(response.body, symbolize_names: true)
    @attributes.each do |attr|
      @event.send(attr).class == Date ? expected = @event.send(attr).to_s : expected = @event.send(attr)
      assert_equal expected, returned[attr.to_sym]
    end
    assert_response :success
  end

  test 'updates with valid attributes' do
    patch :update, format: :json, id: @event, event: { name: 'Oh Hai' }
  end

  test 'does not update with invalid attributes' do
    patch :update, format: :json, id: @event, event: { name: '' }
    assert_response 422
  end

  test 'DELETE #destroy' do
    assert_difference('Event.count', -1) do
      post :destroy, format: :json, id: @event
    end
    assert_response :success
  end

  test 'can add a score for a team' do
    @team.events << @event
    result = Result.find_by(team_id: @team.id, event_id: @event.id)
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 29 }
    assert_equal 29, result.reload.score
  end

  test 'can edit a score for a team' do
    @team.events << @event
    result = Result.find_by(team_id: @team.id, event_id: @event.id)
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 29 }
    assert_equal 29, result.reload.score
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 51 }
    assert_equal 51, result.reload.score
  end

  test 'cannot save a non-integer score' do
    @team.events << @event
    result = Result.find_by(team_id: @team.id, event_id: @event.id)
    assert_raises(ActiveRecord::RecordInvalid) do
      patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 'abc' }
    end
    refute_equal 'abc', result.reload.score
  end

  test 'adding a score also updates team ranking' do
    @team.events << @event
    old_team_rank = @team.ranking
    new_team_rank = old_team_rank + 29
    result = Result.find_by(team_id: @team.id, event_id: @event.id)
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 29 }
    assert_equal new_team_rank, @team.reload.ranking
  end

  test 'reducing an existing score correctly updates team ranking' do
    @team.events << @event
    old_team_rank = @team.ranking
    new_team_rank = old_team_rank + 13
    result = Result.find_by(team_id: @team.id, event_id: @event.id)
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 29 }
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 13 }
    assert_equal new_team_rank, @team.reload.ranking
  end

  test 'increasing an existing score correctly updates team ranking' do
    @team.events << @event
    old_team_rank = @team.ranking
    new_team_rank = old_team_rank + 50
    result = Result.find_by(team_id: @team.id, event_id: @event.id)
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 29 }
    patch :update, format: :json, id: @event, event: { team_ids: [@team.id], score: 50 }
    assert_equal new_team_rank, @team.reload.ranking
  end
end
