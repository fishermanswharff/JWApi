class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user, dependent: :destroy
  validates :title, :body, presence: true
  has_attached_file :image, 
                    :styles => { xlarge: "960x>", large: "600x>", medium: "300x>", thumb: "100x>" },
                    :bucket => 'dubya-blog-bucket',
                    :s3_credentials => {
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end