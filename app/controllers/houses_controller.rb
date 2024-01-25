class HousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    all_houses = House.all
    render json: all_houses, status: :ok
  end

  def show
    house = house_finder
    render json: house, status: :ok
  end

  def create
    new_house = House.create!(house_params)
    render json: new_house, status: :created
  end

  def update
    update_house = house_finder
    update_house.update!(house_params)
    render json: update_house, status: :accepted
  end

  def destroy
    delete_house = house_finder
    delete_house.destroy
    head :no_content
  end

  private

  def house_params
    params.permit(:price, :house_type, :house_number, :floor, :image_url_1, :image_url_2, :image_url_3, :image_url_4, :image_url_5, :has_kitchen, :has_bedroom, :has_bathroom, :has_wifi, :is_vacant)
  end

  def house_finder
    house = House.find(params[:id])
  end

  def render_not_found_response
    render json: { errors: "House not found" }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
