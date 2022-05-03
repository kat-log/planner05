class YoutubeController < ApplicationController
  GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

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

  def index
    @youtube_data = find_videos('明日香ちゃんねる')
  end
  # def index
  #   #YouTube動画を取得
  #   require 'google/apis/youtube_v3'

  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #   youtube.key = Rails.application.credentials.google[:api_key]

  #   options = {
  #     :id => 'UCPyNsNSTUtywkekbDdCA_8Q' #YouTubeチャンネルのIDを指定
  #   }

  #   response = youtube.list_channels(:snippet, **options)

  #   @channel_title = response.items.first
  # end
end
