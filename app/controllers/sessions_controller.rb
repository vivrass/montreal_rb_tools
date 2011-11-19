class SessionsController < ApplicationController
  def create
    # TODO
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  def test
    puts auth_hash.inspect
    render text: auth_hash.inspect
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
