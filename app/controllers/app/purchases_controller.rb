class App::PurchasesController < App::BaseController
  def index
    @purchases = current_user.purchases.order(created_at: :desc).includes(:item)
  end

  def show
    set_purchase
  end

  private

  def set_purchase
    @set_purchase ||= current_user.purchases.find_by!(id: params[:id])
  end
end
