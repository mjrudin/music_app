class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
    @albums = Album.all
  end

  def create
    @track = Track.new(params[:track])
    if @track.save
      flash[:notices] ||= []
      flash[:notices] << "You created a track."
      #redirects to show page for particular track
      redirect_to @track
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid track name"

      @albums = Album.all
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
  end

  def update
    @track = Track.find(params[:id])
    @name = params[:track][:name]
    if @track.update_attributes(params[:track])
      flash[:notices] ||= []
      flash[:notices] << "You updated a track."

      redirect_to @track
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid track name"

      @albums = Album.all
      render :edit
    end
  end

  def destroy
  end

end
