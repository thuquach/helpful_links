class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      flash[:notice] = "Link has been created. Yay!"
      redirect_to @link
    else
      flash[:alert] = "Link has not been created."
      render :action => "new"
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "Link has been updated."
      redirect_to @link
    else
      flash[:alert] = "Link has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = 'Link has been deleted.'
    redirect_to links_path
  end

end
