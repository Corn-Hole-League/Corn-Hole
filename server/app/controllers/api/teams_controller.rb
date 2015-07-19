class Api::TeamsController < ApplicationController
  before_filter :set_default_response_format

  def create
    @league = get_league
    @team = @league.teams.new(team_params)
    if @team.save
      render json: @team, status: 201
    else
      render json: @team.errors, status: 422
    end
  end

  def show
    @league = get_league
    @team = get_team(@league)
    render json: @team, status: 200
  end

  def update
    @league = get_league
    @team = get_team(@league)
    if @team.update_attributes(team_params)
      if params[:team][:event_ids]
        params[:team][:event_ids].each do |e|
          result = Result.new(team_id: @team.id, event_id: e)
          result.save!
        end
      end
      render json: @team, status: 201
    else
      render json: @team.errors, status: 422
    end
  end

  def destroy
    @league = get_league
    @team = get_team(@league)
    @team.destroy
    render json: { head: :no_content }
  end

  private
  def get_league
    League.find(params[:league_id])
  end

  def get_team(league)
    league.teams.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :logo, :ranking, :location, :event_ids)
  end

  def event_ids
    # params.require(:team).permit(:event_ids)
    Event.where(id: params[:event_id])
  end

end
