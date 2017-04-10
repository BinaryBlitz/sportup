class API::EventMembershipsController < API::APIController
  before_action :set_event, only: [:index, :create]

  def index
    @memberships = @event.memberships
  end

  def create
    return head :forbidden unless @event.verify(current_user, params[:password])

    @membership = @event.memberships.build(user: current_user)

    if @membership.save
      render :show, status: :created
    else
      render json: @membership.errors, status: 422
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
