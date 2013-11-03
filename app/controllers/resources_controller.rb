class ResourcesController < ApplicationController
  before_filter :authenticate_user!

  # POST /resources
  def create
    @resource = Resource.build_from_text(params[:resource][:link])
    @resource.user = current_user

    if @resource.save
      User.assign_resource_to_everyone(@resource)
      redirect_to root_path, notice: 'Resource was successfully created.'
    else
      @snippet = Snippet.new
      render "home/index"
    end
  end
end
