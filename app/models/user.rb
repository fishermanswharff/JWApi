class User < ActiveRecord::Base
  # has_many :user_authentications, dependent: :destroy
  # validates :username, :password, presence: true

  before_create :set_token
  has_many :posts
  
  enum role: [:admin,:generic]
  has_secure_password

  has_attached_file :avatar, 
                    :styles => { :medium => "300x>", :thumb => "100x>" },
                    :bucket => 'dubya-blog-bucket',
                    :s3_credentials => {
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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