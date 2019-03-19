class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,:omniauthable, omniauth_providers: [:google_oauth2]
         has_many :comments
         has_many :posts
         has_many :likes
         has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
         validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

         def self.from_omniauth(access_token)
    
           data = access_token.info
           user = User.where(email: data['email']).first

    
          unless user
            user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20],
           confirmed_at: Time.now
           )
          end
    user
end
end