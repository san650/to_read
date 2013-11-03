class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resource = Resource.new
    @snippet = Snippet.new
  end
end
