class API::MapEventsController < ApplicationController
  def index
    @events = Event.all
  end
end
