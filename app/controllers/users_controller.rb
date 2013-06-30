class UsersController < ApplicationController
  before_filter :authenticate_user!

  # GET /users/john
  # GET /users/john.json
  def show
    @user = User.find_by_name(params[:name])
    @order_desc = true if params[:order] == "desc"
    respond_to do |format|
      if @user
        format.html { render 'show' }
      else
        format.html { render :file => "public/404", :formats => [:html], :status => 404 }
      end
    end
  end
end
