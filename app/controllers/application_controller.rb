# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def welcome
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to perform this actions"
      redirect_to new_user_session_url # halts request cycle
    end
  end
end
