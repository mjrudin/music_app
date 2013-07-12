class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      flash[:notices] ||= []
      flash[:notices] << "You created a band"

      redirect_to @band
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid band name"

      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(params[:band])
      flash.now[:notices] ||= []
      flash.now[:notices] << "You updated a band"

      redirect_to band_url
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid band name"

      render :edit
    end
  end

  def destroy
    Band.destroy!(params[:id])
  end

end
