class ChooseController < ApplicationController
  def choose_page
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword], hits: 3)
    end
  end
end
