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
    # upload image to cloudinary
    @value = Cloudinary::Uploader.upload(params[:image])
    # render plain: @value['secure_url']
    # create a new post object and save to db
    @post = @user.posts.new(post_params)
    if @post.save
      # broadcasting posts using pusher
      Pusher.trigger('posts-channel','new-post', {
        image_uri: @post.image_uri,
        vendor: @post.vendor,
        vendor_loc: @post.vendor_loc,
        tag: @post.tag,
        user_id: @post.user_id
      })
      redirect_to users_path, success: "Success you've uploaded your photo!"
    else
      render :new, danger: "Please check the error, somethign is wrong with your input."
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
    params.require(:post).permit({:image_uri => @value['secure_url'], :vendor => params[:vendor], :vendor_loc => params[:vendor_loc], :tag => params[:tag], :user_id => params[:user_id]})
  end
end
