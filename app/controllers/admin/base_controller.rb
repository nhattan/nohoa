class Admin::BaseController < ApplicationController
  authorize_resource
  respond_to :html, :js, :json
end