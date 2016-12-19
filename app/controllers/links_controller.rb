class LinksController < ApplicationController
  before_action :authorize

  def index
    @link = Link.new
    @links = Link.where(user: current_user)
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to root_path
    else
      flash[:warning] = "Not valid URL"
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end

end
