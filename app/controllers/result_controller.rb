class ResultController < ApplicationController

  # プルダウンから受け取った値を元に楽天から結果を取得
  def result_page

    @sex = 0
    if params[:sex]
      @sex = params[:sex]
    end

    @age = 10
    if params[:age]
      @age = params[:age]
    end

    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword]+"プレゼント", hits: 3)
    end
    @ranking_by_age = RakutenWebService::Ichiba::Item.ranking(:age => @age, :sex => @sex)
  end
end
