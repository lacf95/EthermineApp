class HomeController < ApplicationController
  def index
    @credential = Credential.new
  end
end
