require 'test_helper'

class ListingLeaguesTest < ActionDispatch::IntegrationTest
  setup { host! 'example.com' }

  # test 'return list of all leagues' do
  #   get '/leagues'
  #   assert response.success?
  #   refute_empty response.body?
  # end
  #
  # test 'return league by id' do
  #   league = League.create!(name: 'Say Wat Again')
  #   get "/leagues/#{league.id}"
  #   assert response.success?
  # end
end
