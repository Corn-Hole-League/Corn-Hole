class Api::LeaguesController < ApplicationController
  # respond_to :json
  before_filter :set_default_response_format

  def index
    @leagues = League.all
    render json: @leagues
  end

  def create
    @league = League.new(league_params)
    if @league.save
      render json: @league, status: 201
    else
      render json: @league.errors, status: 422
    end
  end

  def show
    @league = get_league
    render json: @league, status: 200
  end

  def update
    @league = get_league
    if @league.update_attributes(league_params)
      render json: @league, status: 201
    else
      render json: @league.errors, status: 422
    end
  end

  def destroy
    @league = get_league
    @league.destroy
    render json: { head: :no_content }
  end

  private

  def get_league
    League.find(params[:id])
  end

  def league_params
    params.require(:league).permit(:name)
  end

end
