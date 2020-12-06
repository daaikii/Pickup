class UsersController < ApplicationController
  before_action :require_user_logged_in,only:[:show,:edit,:update,:destroy]
  before_action :set_correct,only:[:edit,:update,:destroy]
  def show
    @user=User.find(params[:id])
    @posts=@user.posts.order(id: :desc).page(params[:page]).per(30)
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]='ユーザーが登録されました'
      redirect_to @user
    else
      flash.now[:danger]='ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success]='ユーザー情報が更新されました。'
      redirect_to @user
    else
      flash.now[:danger]='ユーザー情報の更新に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success]="退会しました。"
    redirect_to root_url
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:profile,:image)
  end
  
  def set_correct
    @user=current_user
    unless @user
      redirect_to root_url
    end
  end
end