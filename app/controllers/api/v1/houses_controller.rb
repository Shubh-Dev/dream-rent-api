class Api::V1::HousesController < ApplicationController
  def index
    @houses = House.all.order(:id)
    render json: @houses.map { |house|
                   #  return @house.image.attached?
                   house.as_json.merge(
                     image_path: url_for(house.image)
                   )
                 }
  end

  def new
    @house = House.new
  end

  def show
    @house = House.find(params[:id])
    return unless @house.image.attached?

    render json: @house.as_json.merge(
      image_path: url_for(@house.image)
    )
  end

  def create
    @house = House.create!(house_params)
    if @house.save
      render json: @house
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
