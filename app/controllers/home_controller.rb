class HomeController < ApplicationController
  def index
    @threeArticles = Article.limit(3)
  end
end
