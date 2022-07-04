class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook, :success]

  def success
    @listing = Listing.includes(user:[:address]).find(params[:id])
    @listing.update(sold: :true)
    @address = Address.find(@listing.user_id)
  end


  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    buyer_id = payment.metadata.user_id
    listing = Listing.find(listing_id)
    @order = Order.create(listing_id: listing_id, buyer_id: buyer_id, seller_id: listing.user_id)
end


end
  