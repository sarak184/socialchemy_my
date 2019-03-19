class PostsController < ApplicationController
	
  
  before_action :authenticate_user!, only: [ :create, :update, :edit, :destroy]
  #before_action :authorize_post_user, only: [:edit, :update, :destroy]
  
	def index
       
		@post = Post.new
		
		@comment=Comment.new
		

		respond_to do |format|
			format.html 
			format.js
			format.json {render json: @post}
		end
	
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

		if @post.user_id != current_user.id
        redirect_to action: "index"
    
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
		if @post.user_id != current_user.id
        redirect_to action: "index"
    else
		@post.destroy
	end
	end
    respond_to do |format|
    	format.html
    	format.js
    	format.json{ render json:@posts}
    end

	#private
    # Use callbacks to share common setup or constraints between actions.
    #def set_post
      #@post = Post.find(params[:id])
    #end

    
    
     #def authorize_post_user
      #if @post.user_id != current_user.id
        #redirect_to action: "index"
      #end
    #end
 end
end
