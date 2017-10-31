class WelcomeController < ApplicationController
  def index
    @creators = User.all
  end
end
