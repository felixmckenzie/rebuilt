# frozen_string_literal: true

class ListingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :set_form_vars, only: %i[new edit]
  before_action :authenticate_user!, except: [:index]

  # GET /listings or /listings.json
  def index
    # Finds all listings with keyword and category provided by use. Eager or preloads category  
    @q = Listing.includes(:category).ransack(params[:q])
    @listings = @q.result
  end

  # GET /listings/1 or /listings/1.json
  def show
    if current_user
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user&.email,
        line_items: [
          {
            name: @listing.title,
            images: [@listing.picture],
            description: strip_html_tags(@listing.description.to_s),
            amount: (@listing.price * 100),
            currency: 'aud',
            quantity: 1
          }
        ],
        payment_intent_data: {
          metadata: {
            listing_id: @listing.id,
            user_id: current_user&.id
          }
        },
        success_url: "#{root_url}payments/success?id=#{@listing.id}",
        cancel_url: "#{root_url}/listings"
      )
      @session_id = session.id
    end
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit; end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_form_vars
    # Retrieves all categories for create listing form
    @categories = Category.all
    @conditions = Listing.conditions.keys
  end

  def strip_html_tags(string)
    ActionController::Base.helpers.strip_tags(string)
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:title, :description, :condition, :price, :sold, :user_id, :category_id, :picture)
  end
end
