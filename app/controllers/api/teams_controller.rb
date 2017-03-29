class API::TeamsController < API::APIController
  before_action :set_event, only: [:index]

  def index
    @teams = @event.teams
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
