# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  layout :app_layout

  private
    def app_layout
      current_user ? 'application' : 'welcome'
    end
end
