class VotesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @vote = Vote.create(params[:vote])

  end
end
