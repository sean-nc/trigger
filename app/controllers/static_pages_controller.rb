class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def profiles
    @profiles = Profile.search(params[:query])

    respond_to do |format|
      format.html { @profiles = @profiles.paginate(:page => params[:page], :per_page => 30) }
      format.xlsx
    end
  end

  def search
    respond_to do |format|
      format.html do
        # in background
        Thread.new do
          TriggerService.run
        end
      end
      # with AJAX, update stats
      format.js do

      end
    end
  end

  def calendar
  end

  def statistics
    if params[:date]
      @date = Date.parse(params[:date])
      @start_date = @date.beginning_of_day
      @end_date = @date.end_of_day
      @profiles = Profile.where(created_at: @start_date..@end_date)
      @searched_terms = SearchTerm.where(updated_at: @start_date..@end_date).where(searched: true)
    else
      redirect_to calendar_path, notice: 'Please pick a date.'
    end
  end
end
