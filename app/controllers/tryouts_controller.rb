class TryoutsController < ApplicationController
  def new
    @quiz = Quiz.first
  end

  def create
    tryout = Tryout.new(answers: params[:answers])
    tryout.quiz_id = Quiz.first.id

    if Student.exists?(email: params[:email])
      student = Student.where(email: params[:email]).first
      path = new_session_path
    else
      student = Student.new
      student.update_attribute(:email, params[:email])

      path = invite_user_path(email: student.email)
    end

    tryout.student_id = student.id
    tryout.save

    redirect_to path
  end
end
