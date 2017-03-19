class API::SportTypesController < API::APIController
  def index
    @sport_types = SportType.all
  end
end
