class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @bands = Band.all
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      flash[:notices] ||= []
      flash[:notices] << "You created an album."

      redirect_to @album
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid album name"

      @bands = Band.all
      render :new
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @name = params[:album][:name]
    if @album.update_attributes(params[:album])
      flash[:notices] ||= []
      flash[:notices] << "You updated an album."

      redirect_to album_url(@album.id)
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid album name"

      @bands = Band.all
      render :edit
    end
  end

  def destroy
  end

end
