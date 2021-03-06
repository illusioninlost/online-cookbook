class SessionsController < ApplicationController

  def create
    session.delete("user_id") if session[:user_id]
    @user=User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['nickname']
      u.password = auth['info']['name']
      u.password_confirmation = auth['info']['name']
    end

  session[:user_id] = @user.id
  redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end

end
