class StaticPagesController < ApplicationController
  def home
  end

  def search
    TriggerService.run
    redirect_to root_path, notice: 'Search is complete.'
  end
end
