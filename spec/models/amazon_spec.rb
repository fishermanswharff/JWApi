require 'rails_helper'
require 'spec_helper'

describe 'Amazon',type: :model do

  before(:all) do
    @instance = Amazon.get_s3_upload_key
  end

  it 'should return valid json' do
    expect(@instance.class).to be Hash
  end
end