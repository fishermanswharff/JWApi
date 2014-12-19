require 'rails_helper'
require 'spec_helper'
require 'json'

describe 'Amazon',type: :model do

  before(:all) do
    @instance = Amazon.get_s3_upload_key
  end

  it 'returns a hash' do
    expect(@instance.class).to be Hash
  end

  it 'has a valid policy' do
    signKey = JSON.parse(@instance.to_json, symbolize_names:true)
    policy = Base64.decode64(signKey[:policy])
    expect(policy.class).to be String
  end
end