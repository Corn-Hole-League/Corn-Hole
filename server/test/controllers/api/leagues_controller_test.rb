require 'test_helper'

class Api::LeaguesControllerTest < ActionController::TestCase
  def setup
    @leagues = League.all
    @league = leagues(:one)
    @attributes = League.attribute_names
  end

  test "GET #index" do
    get :index, format: :json

    returned = JSON.parse(response.body, symbolize_names: true)[0]
    @attributes.each do |attr|
      assert_equal @league.send(attr), returned[attr.to_sym]
    end
    assert_response :success
  end

  test 'creates with valid attribute' do
    assert_difference('League.count', 1) do
      post :create, format: :json, league: { name: 'MeMeMe' }
    end
    assert_response :success
  end

  test 'does not create with invalid attribute' do
    assert_no_difference('League.count') do
      post :create, format: :json, league: { name: '' }
    end
    assert_response 422
  end

  test '' do

  end


  test 'GET #show' do
    get :show, format: :json, id: @league
    returned = JSON.parse(response.body, symbolize_names: true)
    @attributes.each do |attr|
      assert_equal @league.send(attr), returned[attr.to_sym]
    end
    assert_response :success
  end

  test 'updates with valid attributes' do
    patch :update, format: :json, id: @league, league: { name: 'Oh Hai' }

  end

  test 'does not update with invalid attributes' do
    patch :update, format: :json, id: @league, league: { name: '' }
    assert_response 422
  end

  test 'DELETE #destroy' do
    assert_difference('League.count', -1) do
      post :destroy, format: :json, id: @league
    end
    assert_response :success
  end


end
