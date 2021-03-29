require 'rails_helper'

describe Coffee do
  describe 'validation' do
    %i[blend_name origin notes].each { |property| it { should validate_presence_of property } }
  end
end
