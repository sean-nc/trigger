class SearchTermsController < ApplicationController
  before_action :set_search_term, only: [:edit, :update, :destroy]

  def index
    @search_terms = SearchTerm.all.order(searched: :asc).paginate(:page => params[:page], :per_page => 30)
  end


  def new
    @search_term = SearchTerm.new
  end

  def edit
  end

  def create
    if params[:file]
      SearchTerm.import(params[:file])
      redirect_to search_terms_url, notice: 'File has been uploaded.'
    else
      @search_term = SearchTerm.new(search_term_params)
      @search_term.query += ' -top -dir'
      if @search_term.save
        redirect_to search_terms_url, notice: 'Search term was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    if @search_term.update(search_term_params)
      redirect_to search_terms_url, notice: 'Search term was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @search_term.destroy
    redirect_to search_terms_url, notice: 'Search term was successfully destroyed.'
  end

  private
    def set_search_term
      @search_term = SearchTerm.find(params[:id])
    end

    def search_term_params
      params.require(:search_term).permit(:query)
    end
end
