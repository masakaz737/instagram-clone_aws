class UsersController < ApplicationController
  before_action :login_or_not, {only: [:show, :favorites]}
  before_action :ensure_correct_user, {only: [:show, :favorites]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def login_or_not
    if !current_user
      redirect_to new_session_path, notice: "ログインしてください"
    end
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to posts_path, notice: "権限がありません"
    end
  end

end
