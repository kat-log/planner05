class ResultController < ApplicationController
  def result_page
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end
end
