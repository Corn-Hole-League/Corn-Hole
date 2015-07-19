require 'test_helper'

class Api::EventsControllerTest < ActionController::TestCase
  def setup
    @league = leagues(:one)
    @events = Event.all
    @event = events(:one)
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

end
