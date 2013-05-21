class PhotosController < ApplicationController
  # GET users/1/photos
  # GET users/1/photos.json
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photos }
    end
  end

  # GET users/1/photos/1
  # GET users/1/photos/1.json
  def show
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET users/1/photos/new
  # GET users/1/photos/new.json
  def new
    @user = User.find(params[:user_id])
    @photo = @user.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET users/1/photos/1/edit
  def edit
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
  end

  # POST users/1/photos
  # POST users/1/photos.json
  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to([@photo.user, @photo], :notice => 'Photo was successfully created.') }
        format.json { render :json => @photo, :status => :created, :location => [@photo.user, @photo] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/photos/1
  # PUT users/1/photos/1.json
  def update
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to([@photo.user, @photo], :notice => 'Photo was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/photos/1
  # DELETE users/1/photos/1.json
  def destroy
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to user_photos_url(user) }
      format.json { head :ok }
    end
  end
end
