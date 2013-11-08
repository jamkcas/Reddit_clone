class PagesController < ApplicationController
  def index
    @links = Link.includes(:comments).all

    respond_to do |format|
      format.html
      format.json { render json: @links, include: :comments }
    end
  end
end
