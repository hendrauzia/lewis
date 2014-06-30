require 'rails_helper'

describe TryoutsController, type: :controller do
  before do
    @quiz = create(:quiz)
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    context "not signed in" do
      context "new user" do
        before do
          @email = 'student@lol.lol'
          post :create, email: @email, answers: {}
        end

        it "creates a new student" do
          expect(Student.exists?(email: @email)).to be(true)
        end

        it "save the exam" do
          expect(Student.where(email: @email).first.tryouts.count).to eq(1)
        end

        it "redirects to invite user" do
          expect(response).to redirect_to(invite_user_path(email: @email))
        end
      end

      context "registered user" do
        before do
          @student = create(:student)
          post :create, email: @student.email, answers: {}
        end

        it "save the exam" do
          expect(@student.tryouts.count).to eq(1)
        end

        it "redirects user to sign in" do
          expect(response).to redirect_to(new_session_path)
        end
      end
    end

    context "signed in" do
      it "save the exam" do
        student = create(:student)
        session[:user_id] = student.id
        post :create, answers: {}

        expect(student.tryouts.count).to eq(1)
      end
    end
  end

end
