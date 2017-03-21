class API::EventsController < API::APIController
  skip_before_action :restrict_access!, only: [:index]
  before_action :set_event, except: [:create, :index]
  before_action :set_sport_type, only: [:index]
  before_action :set_date, only: [:index]

  def index
    @events = @sport_type.events.on_date(@date)
  end

  def show
  end

  def create
    @event = current_user.owned_events.build(event_params)

    if @event.save
      render :show, status: :created
    else
      render json: @event.errors, status: 422
    end
  end

  def update
    if @event.update(event_params)
      head :ok
    else
      render json: @event.errors, status: 422
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_sport_type
    @sport_type = SportType.find(params[:sport_type_id])
  end

  def set_date
    @date = params[:date].present? ? params[:date].to_date : Date.today
  end

  def event_params
    params
      .require(:event)
      .permit(
        :name, :starts_at, :ends_at, :address, :description, :latitude,
        :longitude, :user_limit, :team_limit, :price, :sport_type_id
      )
  end
end
