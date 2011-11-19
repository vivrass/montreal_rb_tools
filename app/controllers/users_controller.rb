class UsersController < ApplicationController
  before_filter :signed_in, :only => [:edit]

  def edit
    render :text => auth_hash
  end

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = user
    redirect_to :edit
  end

  def failure
    render :text => auth_hash
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end

