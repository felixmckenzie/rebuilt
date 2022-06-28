class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook, :success]

  def success
    @listing = Listing.includes(user:[:address]).find(params[:id])
  end


  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    buyer_id = payment.metadata.user_id
    listing = Listing.find(listing_id)
    listing.update(sold: true)
    @order = Order.create(listing_id: listing_id, buyer_id: buyer_id, seller_id: listing.user_id)
end


end
  