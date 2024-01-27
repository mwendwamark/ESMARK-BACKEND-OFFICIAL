class LandlordSessionController < ApplicationController
  skip_before_action :authorize_landlord

  def create
    landlord = Landlord.find_by(company_email: params[:company_email])
    if landlord&.authenticate(params[:password])
      session[:landlord_id] = landlord.id
      render json: { landlord: authorize_landlord }, except: [:created_at, :updated_at, :reset_token, :reset_sent_at], status: :ok
    else
      render json: { errors: ["Invalid email or password"] }, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete :landlord_id
    head :no_content
  end
end
