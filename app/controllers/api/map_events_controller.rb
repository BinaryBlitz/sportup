class API::MapEventsController < API::APIController
  skip_before_action :restrict_access!, only: [:index]
  before_action :set_sport_type, only: [:index]

  def index
    @events = @sport_type.events
  end

  private

  def set_sport_type
    @sport_type = SportType.find(params[:sport_type_id])
  end
end
