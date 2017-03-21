class API::VotesController < API::APIController
  before_action :set_event, only: [:create]

  def create
    @vote = @event.votes.build(vote_params)

    if @vote.save
      render :show, status: :created
    else
      render json: @vote.errors, status: 422
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def vote_params
    params.require(:vote).permit(:voted_user_id).merge(user: current_user)
  end
end
