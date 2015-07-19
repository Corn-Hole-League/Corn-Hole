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
      render json: @event, status: 201
    else
      render json: @event.errors, status: 422
    end
    if params[:score].present?
      result = get_result
      result.update_attributes(score_params)
      if @result.save
        render json: @result, status: 201
      else
        render json: @result.errors, status: 422
      end
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
    params.require(:event).permit(:name, :league_id, :location, :occurs_on, :starts_at)
  end

  def score_params
    params.require(:event).permit(:score)
  end

  def get_result
    Result.where(params[:team_id]).first
  end
end
