class QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    raise ActiveRecord::RecordNotFound unless @quiz.published
  end
end
