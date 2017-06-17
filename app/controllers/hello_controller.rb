class HelloController < ApplicationController
  def index
    #render plain: 'こんにちは！'
    @title = "viewてすと" 
  end
end
