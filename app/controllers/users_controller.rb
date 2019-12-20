class UsersController < ApplicationController
  
  def show
 		@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		auto_login(@user)
  		redirect_back_or_to(instructors_url, notice: "Signed up!")
  	else
  		render "new"
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to user_path(@user)
  	else
  		render "edit"
    end
  end

  private
  def user_params
  	params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name, :city_time_zone, :remember )
  end

  def user
    @user ||= User.find_by(id: params[:id])
  end
end
