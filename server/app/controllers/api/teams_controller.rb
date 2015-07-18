class Api::TeamsController < ApplicationController
  # def index
  #   @teams = Team.all
  # end

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
      render json: @team, status: 201
    else
      render json: @team.errors, status: 422
    end
    if params[:event_ids].present?
      @team.events = event_ids
      if @team.save
        render json: @team, status: 201
      else
        render json: @team.errors, status: 422
      end
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
    params.require(:team).permit(:name, :logo, :ranking, :location)
  end

  def event_ids
    Events.where(id: params[:event_ids])
  end

end
