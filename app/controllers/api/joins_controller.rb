class API::JoinsController < API::APIController
  before_action :set_team, only: [:create]
  before_action :set_join, only: [:destroy]

  def create
    @join = @team.joins.build(user: current_user)

    if @join.save
      render :show, status: :created
    else
      render json: @join.errors, status: 422
    end
  end

  def destroy
    @join.destroy
    head :no_content
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_join
    @join = Join.find(params[:id])
  end
end
