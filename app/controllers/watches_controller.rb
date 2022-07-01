class WatchesController < ApplicationController
  
  def index
    # @user = current_user
    # @all_watched_listings_for_user = Watch.where(watcher_id: @user.id)
  end 
  
  def create
  @watch_listing = Watch.new(watches_params)  
  if @watch_listing.save 
    flash[:alert] = "listing saved to watchlist"
     redirect_to watchlist_path
  else
    flash[:alert] = "Something went wrong"
   end
  end


  def destroy
  end

private 

def watches_params
  params.permit(:watched_listing_id, :watcher_id) 
end 

end


