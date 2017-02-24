class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  add_flash_types :danger, :success, :info, :warning
end
