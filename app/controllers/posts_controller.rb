class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find(@post.user_id)
        @signed_in = user_signed_in?
    end
    
    def new
       @post = Post.new() 
    end

    def create
        @post = Post.new(post_params.merge(user: current_user))

        if @post.save
            redirect_to post_path(@post.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end