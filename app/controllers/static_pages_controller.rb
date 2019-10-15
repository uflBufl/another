class StaticPagesController < ApplicationController
  def home
    @games = Game.all
  end

  def help
  end

  def about
  end
end
