require 'open-uri'
require 'json'

class GamesController < ApplicationController

  ALPHABET = ('A'..'Z').to_a

  def new
    @letters = []
    10.times { @letters << ALPHABET.sample }
    save(session[:score], @letters)
  end

  def score
    @user_score = session[:score] || 0
    @letters = session[:letters]
    @word = params[:word]

    if !valid_letters?(@letters)
      @user_score = 0
      @return = "Sorry but #{@word.upcase} can't be built out of #{@letters.join(",  ")}"
    elsif !word_exists?
      @user_score = 0
      @return = "Sorry but #{@word.upcase} does not seem to be a valid English word"
    else
      @user_score += @word.length
      @return = "Congratulations! #{@word.upcase} is a valid English word"
    end
    save(@user_score)
  end

  def word_exists?
    url = "https://wagon-dictionary.herokuapp.com/#{@word.downcase}"
    result = JSON.parse(open(url).read)
    result["found"]
  end

  def valid_letters?(all_letters)
    word_array = @word.upcase.split(//)
    word_array.all? { |letter| all_letters.delete_at(all_letters.index(letter)) if all_letters.include?(letter) }
  end

  def save(score, letters = nil)
    session[:score] = score
    session[:letters] = letters unless letters.nil?
  end
end
