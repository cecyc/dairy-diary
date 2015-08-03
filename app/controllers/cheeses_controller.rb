class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update, :destroy]

  def index
    @cheeses = Cheese.all
    if params[:search]
      @cheeses = Cheese.search(params[:search]).order("created_at DESC")
    else
      @cheeses = Cheese.all.order('created_at DESC')
    end
  end

  def show
  end

  def new
    @cheese = Cheese.new
  end

  def edit
  end

  def create
    @cheese = Cheese.new(cheese_params)

    if @cheese.save
      redirect_to @cheese, notice: 'Cheese was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cheese.update(cheese_params)
      redirect_to @cheese, notice: 'Cheese was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cheese.destroy
    redirect_to cheeses_url, notice: 'Cheese was successfully destroyed.'
  end

  def latest
    @latest_cheeses = Cheese.all.order(created_at: :desc).limit(5)
  end

  private
    def set_cheese
      @cheese = Cheese.find(params[:id])
    end

    def cheese_params
      params.require(:cheese).permit(:name, :thoughts, :category_id, :cheese_image)
    end
end
