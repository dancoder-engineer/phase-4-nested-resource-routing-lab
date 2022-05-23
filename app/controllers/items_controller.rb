class ItemsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found_response


  def index
    if params[:user_id]
      usr = User.find(params[:user_id])
      itms = usr.items
      render json: itms
    else
      items = Item.all
      render json: items, include: :user
    end
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end
  
  def create
    user = User.find(params[:user_id])

      item = user.items.create(permitted)
      render json: item, status: :created

  end


  private

  def permitted
    params.permit(:name, :description, :price)
  end

  def not_found_response
    render json:{error: "Not found"}, status: :not_found
  end

end
