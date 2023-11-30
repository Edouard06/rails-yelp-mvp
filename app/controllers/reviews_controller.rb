class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:new, :create]

  def index
    @reviews = review.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end


def create
  @review = Review.new(review_params)
  @review.restaurant = @restaurant
  if @review.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new, status: :unprocessable_entity
  end
end


  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to reviews_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end







  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

def find_review
  @review = Review.find(params[:id])
end

end
