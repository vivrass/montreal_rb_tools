class UsersController < ApplicationController
  before_filter :signed_in, :only => [:edit]

  def edit
  end

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = user
    redirect_to :edit
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end

