class CommentsController < ApplicationController

  def create
    postid = flash[:post_id]
    comment = Comment.new(params.require(:comment).permit("body"))
    comment.post_id = postid
    comment.user_name = current_user.name
    comment.save()
    redirect_to post_url(postid)
  end

end
