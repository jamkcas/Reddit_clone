class LinksController < ApplicationController
  before_filter :authenticate_user!
  def create
    @link = Link.create(params[:link])

    render json: @link
  end
end
