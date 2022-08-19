class ApplicationController < ActionController::Base
  include Authorization
  include Authentication
  include Pagy::Backend
  include Language
end
