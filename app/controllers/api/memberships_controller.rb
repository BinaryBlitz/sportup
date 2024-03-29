class API::MembershipsController < API::APIController
  before_action :set_membership, only: [:destroy]

  def index
    @memberships = current_user.memberships
  end

  def destroy
    @membership.destroy
    head :no_content
  end

  private

  def set_membership
    @membership = Membership.find(params[:id])
  end
end
