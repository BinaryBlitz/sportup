class API::MessagesController < API::APIController
  before_action :set_event

  def index
    @messages = @event.messages.order(created_at: :desc)
  end

  def create
    @message = @event.messages.build(message_params)

    if @message.save
      render :show, status: :created
    else
      render json: @message.errors, status: 422
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def message_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
