class ProfilesController < ApplicationController
  before_action :set_user, only: [:show]
  
  def show
    @profile = Profile.find_by(user_id: params[:id])
    @posts = Post.where(user_id: params[:id])
  end
  
  def edit
    if user_signed_in?
      @profile = Profile.find_by(user_id: current_user.id)
    else
      redirect_to root_path, notice: 'ログインしてください。'
    end
  end
  
  def new
    if user_signed_in?
      @profile=Profile.new
    else
      redirect_to root_path, notice: 'ログインしてください。'
    end
  end
    
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      url = "/profiles/" + current_user.id.to_s
      redirect_to url, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      url = "/profiles/" + current_user.id.to_s
      redirect_to url, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def profile_params
      params.require(:profile).permit(:user_id, :genre, :description)
    end
end
