class API::EventsController < API::APIController
  before_action :set_event, except: [:create]

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

  def event_params
    params
      .require(:event)
      .permit(
        :name, :starts_at, :ends_at, :address, :description, :latitude,
        :longitude, :user_limit, :team_limit, :price, :sport_type_id
      )
  end
end
