class TryoutsController < ApplicationController
  def new
    @quiz = Quiz.first
  end
end
