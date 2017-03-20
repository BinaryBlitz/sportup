class API::MapEventsController < API::APIController
  skip_before_action :restrict_access!, only: [:index]

  def index
    @events = Event.all
  end
end
