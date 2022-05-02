class ResultController < ApplicationController

  def result_page
    # プルダウンから受け取った値を元に楽天から結果を取得
    @sex = params[:sex]
    @age = params[:age]
    @ranking_by_age = RakutenWebService::Ichiba::Item.ranking(:age => @age, :sex => @sex)

    # ニュースを取得
    require 'news-api'
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp', pageSize: 3)

    #YouTube動画を取得
    require 'google/apis/youtube_v3'

    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:api_key]

    options = {
      :id => 'UCPyNsNSTUtywkekbDdCA_8Q' #YouTubeチャンネルのIDを指定
    }

    response = youtube.list_channels(:snippet, id: options)

    @channel_title = response[:items][0][:snippet][:title]

  end
end
