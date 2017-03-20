class API::SportTypesController < API::APIController
  skip_before_action :restrict_access!, only: [:index]

  def index
    @sport_types = SportType.all
  end
end
