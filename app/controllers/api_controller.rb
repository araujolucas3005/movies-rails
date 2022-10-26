require 'uri'
require 'net/http'

class ApiController < ApplicationController
  def imdb
    term = String(params[:term])
    uri = URI("https://v2.sg.media-imdb.com/suggestion/#{term[0]}/#{term}.json")
    res = Net::HTTP.get_response(uri)
    render json: res.body
  end
end
