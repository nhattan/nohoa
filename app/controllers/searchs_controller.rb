class SearchsController < BaseController
	def index
		@solutions = search.page(params[:page]).per(Settings.search.per_page)
	end

	private
	def search
		Solution.all
	end
end