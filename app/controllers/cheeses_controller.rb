class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update, :destroy]

  def index
    authenticate_user!
    @user = current_user
    if params[:search]
      @cheeses = @user.cheeses.search(params[:search]).order("created_at DESC")
    else
      @cheeses = @user.cheeses.order('created_at DESC')
    end
  end

  def show
    authenticate_user!
  end

  def new
    authenticate_user!
    @cheese = Cheese.new
  end

  def edit
  end

  def create
    authenticate_user!
    @cheese = Cheese.new(cheese_params)
    @cheese.update(user_id: current_user.id)
    @cheese.save

    if @cheese.save
      redirect_to @cheese, notice: 'Cheese was successfully created.'
    else
      render :new
    end
  end

  def update
    authenticate_user!
    if @cheese.update(cheese_params)
      redirect_to @cheese, notice: 'Cheese was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authenticate_user!
    @cheese.destroy
    redirect_to cheeses_url, notice: 'Cheese was successfully destroyed.'
  end

  def latest
    authenticate_user!
    @user = current_user
    @latest_cheeses = @user.cheeses.order(created_at: :desc).limit(5)
  end

  private
    def set_cheese
      @cheese = Cheese.find(params[:id])
    end

    def cheese_params
      params.require(:cheese).permit(:name, :thoughts, :category_id, :cheese_image, :user_id)
    end
end
