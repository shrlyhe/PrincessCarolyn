class QuotesController < ApplicationController
  def index
  	@all_quotes = Quote.page(params[:page]).per(25)
  	if params[:search]
  		@all_quotes = Quote.search(params[:search]).order("created_at DESC")
  	else
  		@all_quotes = Quote.all.order("created_at DESC")
  	end
  end

  def new
  	@quote = Quote.new
  end

  def create
  	@quote = Quote.new(params.require(:quote).permit(:quote, :url))
  	if @quote.save
  		redirect_to root_path
  	else
  		render "new"
  	end
  end

  def destroy
  	@quote = Quote.find(params[:id])
  	if @quote.destroy
  		#redirect_to root_path
  		redirect_back(fallback_location: root_path)
  	else
  		flash[:alert] = "Error deleting post"
  	end
  end

  def update
  	@quote = Quote.find(params[:id])
  	if @quote.update(params.require(:quote).permit(:quote, :url))
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

end
