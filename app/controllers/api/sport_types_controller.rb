class API::SportTypesController < API::APIController
  skip_before_action :restrict_access!, only: [:index]
  before_action :set_city, only: [:index]

  def index
    @sport_types = SportType.by_city(@city)
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end
end
