class ApplicationController < ActionController::Base
    include SessionsHelper
    rescue_from ActionController::RoutingError, with: :render_404
end
