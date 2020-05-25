require 'open-uri'

class GamesController < ApplicationController
  def new
    @mygrid = [*('A'..'Z')].sample(8).join(' ')
  end

  def score
    myarray = params[:grid].split(' ')
    myarray = myarray.sort
    myanswer = params[:answer].upcase.split('').sort
    if (myanswer - myarray).empty?
      url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
      word_serialized = open(url).read
      word = JSON.parse(word_serialized)
      if word['found']
        @results = "your score is #{word['length']}"
      else
        @results = "your word doesn't exist in the english dictionary"
      end
    end
    if (myanswer - myarray).empty? == false
      @result = 'You passed a word that is not contained in the grid'

    end
  end
end
