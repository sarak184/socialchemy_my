class PostsController < ApplicationController
	
	def index
       
		@post = Post.new
		
		@comment=Comment.new
	
	end

	def create

		@post = Post.create(
		
                content: params[:post][:content],
                user_id: current_user.id
                )
			@comment=Comment.new
	end
	def edit
		@post=Post.find(params[:id])
	end
	def update
		@post=Post.find(params[:id])
		@post.update(
          content: params[:post][:content]
           )
		redirect_to action: 'index'
	end

	
	def destroy
		@post= Post.find(params[:id])
		@post.destroy
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
     def authorize_post_user
      if @post.user_id != current_user.id
        redirect_to action: "index"
      end
    end

end
