class ResultController < ApplicationController

  def result_page
    # プルダウンから受け取った値を元に楽天から結果を取得
    @sex = params[:sex]
    @age = params[:age]
    @ranking_by_age = RakutenWebService::Ichiba::Item.ranking(:age => @age, :sex => @sex)

    # ニュースを取得
    require 'news-api'
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp')
  end
end
