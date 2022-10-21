require 'rails_helper'

RSpec.describe 'Merchants API' do
  it 'sends a list of all merchants' do
    create_list(:merchant, 3)

    get api_v1_merchants_path

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)
    
    expect(merchants[:data].count).to eq(3)
    
    merchants[:data].each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_a(String)
      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a(String)
    end
  end
  it 'can send one merchant' do
    id = create(:merchant).id
    get api_v1_merchant_path(id)
    
    expect(response).to be_successful
    merchant = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(merchant.count).to eq(1)
    expect(merchant[:data][0][:id]).to eq(id.to_s)

    expect(merchant[:data][0]).to have_key(:id)
    expect(merchant[:data][0][:id]).to be_a(String)
    expect(merchant[:data][0][:attributes]).to have_key(:name)
    expect(merchant[:data][0][:attributes][:name]).to be_a(String)
  end
end