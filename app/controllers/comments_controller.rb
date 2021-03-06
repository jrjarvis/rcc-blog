class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_comment, only: :destroy
  
	# create method
	def create

		if @post.comments.create(comment_params)
			redirect_to @post, notice: 'Comment was successfully created.'
		else
			redirect_to @post, alert: 'Error creating comment.'
		end
	end

	def destroy

		@comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

private

	# protect the comment from unauthorized parameters
	def comment_params
		params.require(:comment).permit(:author, :email, :body)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

	def set_comment
			@comment = @post.comments.find(params[:id])
	end

end
