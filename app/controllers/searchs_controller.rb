class SearchsController < BaseController
  def index
    @search_items = Elasticsearch::Model.search params[:search][:keyword], [], {size: 20}
    @search_items = @search_items.map{|r| r['_type'].classify.constantize.where(id: r['_id'])}.flatten
    @bugs = @search_items.select{|item| item.is_a? Bug}
    @solutions = @search_items - @bugs
  end
end
