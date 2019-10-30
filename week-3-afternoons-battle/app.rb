# frozen_string_literal: true

require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/message'

# the controller
class Battle < Sinatra::Base
  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    name1 = Player.new(params[:name_1])
    name2 = Player.new(params[:name_2])
    @game = Game.create(name1, name2, Message.new)
    redirect '/fight'
  end

  get '/fight' do
    redirect '/winner' if @game.winner != 2
    @game.switch if @game.players[@game.friend].zzz
    erb(:fight)
  end

  post '/turn' do
    heal = params[:heal] == 'true'
    what = params[:what].to_i
    with = params[:with].to_i
    @game.ready(heal, what, with)
    redirect '/fight'
  end

  get '/winner' do
    erb(:winner)
  end
end
