class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @recent_posts = Post.order(:date).last(4)
    @categories = Post.categories

    per_pages = 12

    if category = params[:category]
      @posts = Post.where(category: category).page(params[:page]).per(per_pages)
      @title = 'Posts of category ' + @categories.key(category.to_i)
    elsif user_id = params[:user]
      @posts = Post.where(user_id: user_id).page(params[:page]).per(per_pages)
      @title = 'All Posts of ' + User.find(user_id).full_name
    else
      @posts = Post.page(params[:page]).per(per_pages)
      @title = "All posts"
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @recent_posts = Post.order(:date).last(4)
    @categories = Post.categories

    @suggested_posts = Post.where(category: @post.category).order(:date).last(3)
    if @suggested_posts.count < 3
      @suggested_posts = Post.order(:date).last(3)
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :subtitle, :user_id, :date, :body)
    end
end
