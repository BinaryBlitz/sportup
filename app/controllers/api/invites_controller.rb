class API::InvitesController < API::APIController
  before_action :set_event, only: [:create]
  before_action :set_invite, only: [:update, :destroy]

  def index
    @invites = current_user.invites
  end

  def create
    @invites = @event.invites.build(invites_params[:invites])

    invalid_invite = @invites.find(&:invalid?)

    if invalid_invite.present?
      render json: invalid_invite.errors, status: 422
    else
      @invites.each(&:save)
      render :index, status: :created
    end
  end

  def update
    @invite.accept
    head :ok
  end

  def destroy
    @invite.destroy
    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invites_params
    params.permit(invites: [:user_id])
  end
end
