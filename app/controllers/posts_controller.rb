class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # INDEX/SHOW all posts
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  # SHOW SINGLE POST
  def show
    @user = User.find(params[:user_id])
    set_post
    render plain: params[:vendor].inspect
    
  end

  # Render new post form/page
  def new
    @post = Post.new
  end

  # Render edit post form/page
  def edit
    @user = User.find(params[:user_id])
    set_post
  end

  # Create new post
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)

    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end


  # PATCH/PUT edited post
  def update
    @user = User.find(params[:user_id])
    set_post

    if @post.update_attributes(post_params)
      redirect_to user_posts_path
    else
      render :edit
    end
  end

  # DELETE/destroy post
  def destroy
    @user = User.find(params[:user_id])
    set_post
    @post.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image_uri, :vendor, :vendor_loc, :tag, :user_id)
  end
end
