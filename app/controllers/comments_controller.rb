class CommentsController < ApplicationController
  before_action :find_film

  def index
    @film.comments = @film.comments.arrange(order: :created_at)
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @film = Film.find(params[:film_id])
    @comment = @film.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to film_path(@film)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def find_film
    @film = Film.find(params[:film_id])
  end

end
