# frozen_string_literal: true

class WatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def create
    @watch_listing = Watch.new(watches_params)
    if @watch_listing.save
      flash[:alert] = 'listing saved to watchlist'
      redirect_to watchlist_path
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def destroy
    Watch.destroy_by(listing_id: params[:id])
    flash[:alert] = 'listing removed from watchlist'
    redirect_to watchlist_path
  end

  private

  def watches_params
    params.permit(:listing_id, :user_id)
  end
end
