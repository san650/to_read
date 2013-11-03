class UsersController < ApplicationController
  before_filter :authenticate_user!

  # GET /john
  # GET /john/desc
  def show
    user = User.find_by_name(params[:name])

    respond_to do |format|
      if user
        manager = BookmarksCatalog.new(user)
        if params[:order] == "desc"
          @catalog = manager.descending
        else
          @catalog = manager.ascending
        end

        format.html { render 'show' }
      else
        format.html { render :file => "public/404", :formats => [:html], :status => 404 }
      end
    end
  end

  # GET /john/archived
  def archived
    @user = User.find_by_name(params[:name])
    respond_to do |format|
      if @user
        format.html { render }
      else
        format.html { render :file => "public/404", :formats => [:html], :status => 404 }
      end
    end
  end

  # GET /customize
  def customize
    respond_to do |format|
      format.html { render }
    end
  end

  # PUT /customize
  def edit
    current_user.update_attribute(:custom_javascript, params[:customize][:custom_javascript])
    redirect_to customize_url
  end
end
