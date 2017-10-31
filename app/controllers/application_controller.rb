class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description])
  end

  
  def create_post
    @post = Post.new(post_params)
    if @post.save
      url = "/profiles/" + current_user.id.to_s
      redirect_to url, notice: '投稿されました。'
      #後でエラー処理記述。
    end
  end
  
  def new_comment
    @newcomment = Comment.new
  end
  
  def create_comment
    @newcomment = Comment.new(comment_params)
    if @newcomment.save
      url = "/profiles/8"
      redirect_to url, notice: '投稿されました。'
      #後でエラー処理記述。
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :image)
    end
    
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content)
    end
end
