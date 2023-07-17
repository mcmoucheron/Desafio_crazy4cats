class CommentsController < ApplicationController
    def create
        @adventure = Adventure.find(params[:comment][:adventure_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        respond_to do |format|
            if @comment.save
                format.html { redirect_to adventure_path(@adventure.id), notice:
                'Se creó tu comentario.' }
            else
                format.html { redirect_to adventure_path(@adventure.id), notice:
                'No se creó tu comentario.' }
            end
        end
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:content, :adventure_id)
    end
end
