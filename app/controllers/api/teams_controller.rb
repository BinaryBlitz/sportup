class API::TeamsController < API::APIController
  before_action :set_event, only: [:index, :create]
  before_action :set_team, only: [:update, :destroy]

  def index
    @teams = @event.teams
  end

  def create
    @team = @event.teams.build(team_params)

    if @team.save
      render :show, status: :created
    else
      render json: @team.errors, status: 422
    end
  end

  def update
    if @team.update(team_params)
      head :ok
    else
      render json: @team.errors, status: 422
    end
  end

  def destroy
    @team.destroy
    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:number).merge(user: current_user)
  end
end
