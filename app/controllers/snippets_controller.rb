class SnippetsController < ApplicationController
  before_filter :authenticate_user!

  # GET /john/snippets
  def index
    @user = User.find_by_name!(params[:name])
    @snippets = @user.snippets
  end

  # POST /snippets
  def create
    @snippet = Snippet.build_from_text(params[:snippet][:raw], current_user)

    if @snippet.save
      redirect_to root_path, notice: 'Snippet was successfully created.'
    else
      @resource = Resource.new
      render "home/index"
    end
  end
end
