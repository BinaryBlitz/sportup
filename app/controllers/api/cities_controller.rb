class API::CitiesController < API::APIController
  def index
    @index = City.all
  end
end
