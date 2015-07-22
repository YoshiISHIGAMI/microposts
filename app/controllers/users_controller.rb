class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]

  def index
    @users = User.all
  end
  
  def show
    @microposts = @user.microposts
  end

  def followings
    @followings_user = @user.following_relationships
  end

  def followers
    @followers_user = @user.followed_relationships
    #@followers_user = @user.following_relationships.find_by(followed_id: other_user.id)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :country)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
