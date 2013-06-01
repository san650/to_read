class UsersController < ApplicationController
  # GET /users/john
  # GET /users/john.json
  def show
    @user = User.find_by_name(params[:name])

    respond_to do |format|
      format.html { render 'show' }
      format.json { render json: @user }
    end
  end
end
