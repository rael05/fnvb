class HomeController < ApplicationController
  def index
    @threeArticles = Article.where(enabled: true).limit(3)
  end
end
