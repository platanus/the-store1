class App::ItemsController < App::BaseController
  def index
    @items = Item.all.includes(:reviews)
  end

  def show
    item
    reviews
  end

  private

  def item
    @item ||= Item.find(params[:id])
  end

  def reviews
    @reviews ||= item.reviews.order(created_at: :desc).includes([:user])
  end
end
