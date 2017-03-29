class API::PurchasesController < API::APIController
  def index
    render json: Purchase.tickets_list
  end

  def create
    @purchase = current_user.purchases.build(purchase_params)

    receipt = PurchaseVerification.new(params[:receipt], params[:platform])
    if receipt.verify
      @purchase.save
      render json: receipt
    else
      render json: { message: 'Invalid receipt' }
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:receipt, :platform)
  end
end
