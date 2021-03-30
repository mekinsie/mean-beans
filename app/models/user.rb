class User < ApplicationRecord
  before_save :set_api_key

  def set_api_key
    self.api_key = SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
