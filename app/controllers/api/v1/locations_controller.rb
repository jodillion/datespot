class Api::V1::LocationsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user, except: [:index, :show]

  def index
    locations = Location.all
    render json: locations
  end

  def show
    location = Location.find(params["id"])
    reviews = location.reviews
    payload = {"location":location, "reviews": reviews}
    render json: payload
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :zip, :user_id)
  end

  def authenticate_user
    if !user_signed_in? || current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to new_user_registration_path
    end
  end
end
