class API::TeamsController < API::APIController
  before_action :set_team, only: [:create, :update]

  def create
    if @team.join(params[:team_number])
      render json: @team, status: :created
    else
      render json: @team.errors, status: 422
    end
  end

  def update
    @team.leave
    head :ok
  end

  private

  def set_team
    @team = Event.find(params[:event_id]).member(current_user)
  end
end
