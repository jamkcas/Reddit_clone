class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @comment = Comment.create(params[:comment])

    render json: @comment
  end
end
