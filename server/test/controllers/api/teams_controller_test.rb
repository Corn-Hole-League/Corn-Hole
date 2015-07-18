require 'test_helper'

class Api::TeamsControllerTest < ActionController::TestCase
  def setup
    @league = leagues(:one)
    @teams = Team.all
    @team = @league.teams.create!(name: 'Teamie McTeam')
    @attributes = Team.attribute_names
  end

  # test "GET #index" do
  #   get :index, format: :json
  #
  #   returned = JSON.parse(response.body, symbolize_names: true)[0]
  #   @attributes.each do |attr|
  #     @team.send(attr).class == Date ? expected = @team.send(attr).to_s : expected = @team.send(attr)
  #     assert_equal expected, returned[attr.to_sym]
  #   end
  #   assert_response :success
  # end

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

end
