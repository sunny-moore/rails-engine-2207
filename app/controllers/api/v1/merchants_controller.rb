class Api::V1::MerchantsController < ApplicationController

  def index
    render json: MerchantSerializer.merchants(Merchant.all)
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.merchant(merchant)
  end
end