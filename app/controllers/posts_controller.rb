class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 

  # INDEX/SHOW all posts
  def index
    @posts = Post.all
  end

  # SHOW SINGLE POST
  def show
    render plain: params[:vendor].inspect
  end

  # Render new post form/page
  def new
    @post = Post.new
  end

  # Render edit post form/page
  def edit
  end

  # Create new post
  def create
    @post = @user.posts.create(post_params)

    if @post.save
      redirect_to users_path, success: "Post successfully updated!"
    else
      render :new
    end
  end


  # PATCH/PUT edited post 
  # NEED TO FIX: INVALID SIGNATURE ERROR
  def update    
    if @post.update_attributes(post_params)
      redirect_to user_posts_path, success: "Post successfully updated!"
    else
      render :edit
    end
  end

  # DELETE/destroy post
  def destroy
    @post.destroy
    redirect_to user_path, success: "Post successfully deleted!"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:image_uri, :vendor, :vendor_loc, :tag, :user_id)
  end
end
