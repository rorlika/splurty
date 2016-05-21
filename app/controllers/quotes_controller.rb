class QuotesController < ApplicationController
	def index
		@quote = Quote.all
	end

	def new
		@quote = Quote.new
    end
    def create
    	@quote = Quote.create(quote_params)
        if @quote.invalid?
            flash[:error] = '<strong>Could not save </strong> the data you entered is invalid.'
        end
        redirect_to root_path
    end

    private

    def quote_params
    	quote_params = params.require(:quote).permit(:saying,:author)
        
        quote_params[:author] = quote_params[:author].capitalize
        
        quote_params[:saying] = quote_params[:saying].titleize

        quote_params

    end
end
