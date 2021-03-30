require 'rails_helper'

describe User do

  before { @user = User.create }

  it 'creates a user with a random api key' do
    expect(@user.api_key).not_to eq nil
  end

  it 'has a length of 24' do
    expect(@user.api_key.length).to eq 24
  end

end