class ResultController < ApplicationController

  # プルダウンから受け取った値を元に楽天から結果を取得
  def result_page
    @sex = params[:sex]
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword], hits: 3)
    end
    @ranking_by_age = RakutenWebService::Ichiba::Item.ranking(:age => 20, :sex => @sex)
  end
end
