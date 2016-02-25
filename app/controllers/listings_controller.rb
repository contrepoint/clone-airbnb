class ListingsController < ApplicationController

	def index
	end

	def new
	end

	def create
		new_listing = Listing.new(listing_params)
		new_listing.user_id = current_user.id
		if new_listing.save
			redirect_to user_path(current_user.id)
		else
			redirect_to new_listing_path
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		# WIP
	end

	def destroy
		# WIP
	end

  private
  def listing_params
    params.require(:listing).permit(:user_id, :rent_per_night, :no_of_guests, :street_address, :city,
    	:state, :country, :room_type, :description, :house_rules)
  end

end