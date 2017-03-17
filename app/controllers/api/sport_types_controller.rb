class API::SportTypesController < API::APIController
  def index
    @index = SportType.all
  end
end
