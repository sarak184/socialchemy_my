class CommentsController < ApplicationController
	
	def create

		if( params[:comment][:parent_type]=='Post')
			@parent=Post.find(params[:comment][:parent_id])
		else
			@parent = Comment.find(params[:comment][:parent_id])
		end

		@comment = Comment.create(
                   content: params[:comment][:content],
                   user_id: current_user.id,
                   parent: @parent
			       )
		UserMailer.new_comment(@comment).deliver_now
		
	end
	
	def destroy
    @comment= Comment.find(params[:id])
  	#post_id = @comment.post_id
  	@comment.comments.destroy_all
    @comment.destroy 
    
    end
end

