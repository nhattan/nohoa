class Admin::BaseController < ApplicationController
  authorize_resource
  respond_to :html, :js, :json
  layout "admin/application"

  rescue_from CanCan::AccessDenied do |e|
  	redirect_to root_url, alert: e.message
  end
end