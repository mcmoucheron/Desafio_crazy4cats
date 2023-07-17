class ReactionsController < ApplicationController
    def new_user_reaction
        @user = current_user
        @type = params[:reaction_type]
        @adventure = Adventure.find(params[:adventure_id]) if params[:adventure_id]
        @comment = Comment.find(params[:comment_id]) if params[:comment_id]
        @kind = params[:kind]
    respond_to do |format|
        (@type == "comment") ? reaction_comment = Reaction.find_by(user_id: @user,
    comment_id: @comment.id) : reaction_adventure = Reaction.find_by(user_id: @user.id,
    adventure_id: @adventure.id)

        if reaction_adventure || reaction_comment
            format.html { redirect_to adventure_path(@adventure), notice: 'You already reacted
    to this adventure' }
        else
            (@type == "adventure") ? @reaction = Reaction.new(user_id: @user.id, adventure_id:
    @adventure.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(user_id:
    @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)
            if @reaction.save!
                format.html { redirect_to adventure_path(@adventure), notice: 'Reaction was
        successfully created.' }
            else
                format.html { redirect_to adventure_path(@adventure), notice: 'Something went
        wrong' }
            end
        end
    end
    end
end
