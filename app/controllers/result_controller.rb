class ResultController < ApplicationController

  # プルダウンから受け取った値を元に楽天から結果を取得
  def result_page
    @sex = params[:sex]
    @age = params[:age]
    @ranking_by_age = RakutenWebService::Ichiba::Item.ranking(:age => @age, :sex => @sex)
  end
end
