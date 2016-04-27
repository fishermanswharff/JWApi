class User < ActiveRecord::Base

  before_create :set_token
  has_many :posts

  enum role: [:admin,:generic]
  has_secure_password

  def self.create_from_omniauth(params)
    attributes = {
      username: params['info']['name'],
      password: params['credentials']['token']
    }
    create(attributes)
  end

  private

  def set_token
    return if token.present?
    self.token = generate_token
  end

  def generate_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
