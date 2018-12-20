class ProfilesController < ApplicationController
  def index
    @profiles = Profile.search(params[:query])

    respond_to do |format|
      format.html { @profiles = @profiles.paginate(:page => params[:page], :per_page => 30) }
      format.xlsx
    end
  end

  before_action :set_profile, only: [:edit, :update, :destroy]

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    if params[:file]
      Profile.import(params[:file])
      redirect_to profiles_url, notice: 'File has been uploaded.'
    else
      @profile = Profile.new(profile_params)
      @profile.email += ' -top -dir'
      if @profile.save
        redirect_to profiles_url, notice: 'Profile was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_url, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:email)
    end
end
