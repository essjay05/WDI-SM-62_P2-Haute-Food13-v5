class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 

  # INDEX/SHOW all posts
  def index
    @posts = Post.all
    set_user
  end

  # SHOW SINGLE POST
  def show
    set_user
    set_post
    render plain: params[:vendor].inspect
    
  end

  # Render new post form/page
  def new
    @post = Post.new
  end

  # Render edit post form/page
  def edit
    set_user
    set_post
  end

  # Create new post
  def create
    set_user
    @post = @user.posts.create(post_params)

    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end


  # PATCH/PUT edited post
  def update
    set_user
    set_post

    if @post.update_attributes(post_params)
      redirect_to user_posts_path
    else
      render :edit
    end
  end

  # DELETE/destroy post
  def destroy
    set_user
    set_post
    @post.destroy
    redirect_to user_path, success: "Profile successfully deleted!"
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
