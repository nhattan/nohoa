class FacebookAuthsController < BaseController
  def create
  	user = User.from_omniauth(env["omniauth.auth"])
    sign_in user
    redirect_to root_url
  end
end
