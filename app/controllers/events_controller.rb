class EventsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    events= Event.all
    render json: events
  end

end
