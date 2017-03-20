class API::InvitesController < API::APIController
  before_action :set_event, only: [:create]
  before_action :set_invite, only: [:update, :destroy]

  def index
    @invites = current_user.invites
  end

  def create
    @invite = @event.invites.build(invite_params)

    if @invite.save
      render :show, status: :created
    else
      render json: @invite.errors, status: 422
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

  def invite_params
    params.require(:invite).permit(:user_id)
  end
end
