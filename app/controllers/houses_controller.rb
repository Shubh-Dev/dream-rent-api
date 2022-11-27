class HousesController < ApplicationController
  def index
    @houses = House.all.order(:id)
  end

  def new
    @house = House.new
  end

  def show
    @house = House.find(params[:id])
  end

  def create
    @house = House.create!(house_params)
    if @house.save
      redirect_to houses_path
    else
      @errors = @house.errors.full_messages
      render :new
    end
  end

  def destroy
    house = House.find(params[:id])
    house.destroy
    redirect_to houses_path
  end

  def update; end

  private

  def house_params
    params.require(:house).permit(:address, :house_type, :rooms, :balcony, :size, :image)
  end
end
