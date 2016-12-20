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
      flash[:error] = "Not a valid URL"
      redirect_to root_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to root_path
    else
      flash[:error] = "Not a valid URL"
      redirect_to edit_link_path(@link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end

end
