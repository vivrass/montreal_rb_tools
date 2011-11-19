class User < ActiveRecord::Base
  belongs_to :users_twitter, :foreign_key => :id
  belongs_to :users_fake, :foreign_key => :id

  has_many :talks, :foreign_key => :talker_id

  def self.find_or_create_from_auth_hash(auth_hash)
    twitter_user = UsersTwitter.find_by_twitter_id(auth_hash.params[:user_id])
    if twitter_user.nil?
      user = User.create!
      UsersTwitter.create!(id: u.id, 
                           screen_name: auth_hash.params[:screen_name],
                           twitter_id: auth_hash.params[:user_id],
                           oauth_token: auth_hash.params[:oauth_token],
                           oauth_token_secret: auth_hash.params[:oauth_token_secret]
                          )
    else
      user = User.find_by_id(twitter_user.id)
    end
  end
end
