class CommentsController < ApplicationController
    # create comments
    def create
        # get article by ID
        @article = Article.find(params[:article_id])
        # add new comment associated with the article
        @comment = 
            @article.comments.create(comment_params)
                redirect_to article_path(@article)
    end

    # check for and delete spam comments
    def destroy
        @article = Article.find(params[:article_id])
        @comment = Article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
