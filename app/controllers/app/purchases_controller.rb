class App::PurchasesController < App::BaseController
  def index
    @purchases = purchases.includes(:item, :delivery_company).order(created_at: :desc)
  end

  def show
    set_purchase
  end

  private

  def set_purchase
    @set_purchase ||= purchases.find_by!(id: params[:id])
  end

  def purchases
    current_user.purchases
  end
end
