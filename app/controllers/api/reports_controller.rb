class API::ReportsController < API::APIController
  before_action :set_event, only: [:create]

  def index
    @reports = current_user.reports
  end

  def create
    @reports = @event.reports.build(reports_params[:reports])
    @reports.each { |report| report.user = current_user }

    invalid_report = @reports.find(&:invalid?)

    if invalid_report.present?
      render json: invalid_report.errors, status: 422
    else
      @reports.each(&:save)
      render :index, status: :created
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def reports_params
    params.permit(reports: [:content, :violation, :reported_user_id])
  end
end
