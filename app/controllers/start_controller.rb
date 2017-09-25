class StartController < ApplicationController

  def index
  end

  def new
  end

  def test
  end

  private

  def check_user
    if user_signed_in?
      redirect_to account_url,
      alert: 'You are already signed in.'
    end
  end

end
