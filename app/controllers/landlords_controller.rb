class LandlordsController < ApplicationController
  skip_before_action :authorize_landlord, only: [:create, :destroy, :show, :index]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    landlord = Landlord.all
    render json: landlord
  end

  def show
    render json: { landlord: authorize_landlord }, except: [:created_at, :updated_at], status: :ok
  end

  def create
    create_landlord = Landlord.create!(land_lord_params)
    session[:landlord_id] = create_landlord.id
    render json: create_landlord, status: :created
  end

  def destroy
    delete_landlord = landlord_finder
    delete_landlord.destroy
    head :no_content
  end

  private

  def landlord_finder
    landlord = Landlord.find(params[:id])
  end

  def land_lord_params
    params.permit(:name, :company_email, :company_phone_number, :password, :password_confirmation)
  end

  def render_not_found_response
    render json: { errors: "Tenant not found" }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
