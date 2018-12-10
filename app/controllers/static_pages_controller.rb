class StaticPagesController < ApplicationController
  def home
  end

  def search
    respond_to do |format|
      format.html do
        # in background
        Thread.new do
          WakeUpService.run
          TriggerService.run
        end
      end
      # with AJAX, update stats
      format.js do

      end
    end
  end
end
