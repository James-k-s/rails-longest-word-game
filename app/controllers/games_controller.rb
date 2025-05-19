require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    url = "https://dictionary.lewagon.com/#{params[:word]}"
    user_serialized = URI.parse(url).read
    data = JSON.parse(user_serialized)

    @tf = "#{data["found"]}"
    @each_char = []

    params[:word].each_char do |char|
      if @letters.include?(char)
        @each_char << 'true'
      else
        each_char << 'false'
      end
    end
    # if @tf
    #   @english_word = "Your word has been found in the English dictiontary📖"
    # end
  end
end
