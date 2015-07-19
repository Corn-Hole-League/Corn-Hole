class Api::EventsController < ApplicationController
  before_filter :set_default_response_format

  def index
    @events = Event.all
    render json: @events
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: 201
    else
      render json: @event.errors, status: 422
    end
  end

  def show
    @event = get_event
    render json: @event, status: 200
  end

  def update
    @event = get_event
    if @event.update_attributes(event_params)
      if params[:event][:team_ids] && params[:event][:score]
        team_id = params[:event][:team_ids].first
        result = get_result(team_id)
        result.score = params[:event][:score]
        result.save!
      end
      render json: @event, status: 201
    else
      render json: @event.errors, status: 422
    end
  end

  def destroy
    @event = get_event
    @event.destroy
    render json: { head: :no_content }
  end

  private

  def get_event
    Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :league_id, :location, :occurs_on, :starts_at, :team_ids)
  end

  def get_result(team_id)
    @event.results.find_by(team_id: team_id)
  end

end
