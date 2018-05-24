class SessionsController < ApplicationController

  def create
    @user=User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
  end

  session[:user_id] = @user.id
  redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end

end
