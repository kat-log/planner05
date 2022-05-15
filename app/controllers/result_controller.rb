class ResultController < ApplicationController
  def result_page
    pull_rakuten_item
    pull_news
    # pull_youtube_video
    X_pull_youtube_video('爆笑動画 まとめ')
  end

  def pull_rakuten_item
    # プルダウンから受け取った値を元に楽天から結果を取得
    @sex = params[:sex]
    @age = params[:age]
    @ranking_by_age = RakutenWebService::Ichiba::Item.ranking(:age => @age, :sex => @sex)
  end

  def pull_news
    # ニュースを取得
    require 'news-api'
    news = News.new(ENV['NEWS_API_KEY'])
    @news = news.get_top_headlines(country: 'jp', pageSize: 3)
  end

  def pull_youtube_video
    # YouTube動画を取得
    @youtube_data = find_videos('インディアンス')
  end

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Rails.application.credentials.google[:api_key]

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 3,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, **opt)
  end


  def X_pull_youtube_video(keyword, after: 1.months.ago, before: Time.now)
    # YouTube動画を取得
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Rails.application.credentials.google[:api_key]

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 3,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    
    @youtube_data = service.list_searches(:snippet, **opt)
  end

  # def X_find_videos(keyword, after: 1.months.ago, before: Time.now)
  #   service = Google::Apis::YoutubeV3::YouTubeService.new
  #   service.key = Rails.application.credentials.google[:api_key]

  #   next_page_token = nil
  #   opt = {
  #     q: keyword,
  #     type: 'video',
  #     max_results: 3,
  #     order: :date,
  #     page_token: next_page_token,
  #     published_after: after.iso8601,
  #     published_before: before.iso8601
  #   }
  #   service.list_searches(:snippet, **opt)
  # end

end
