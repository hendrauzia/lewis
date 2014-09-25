require 'rails_helper'

describe TryoutsController do
  let!(:quiz) { create :quiz }

  describe "GET new" do
    before { get :new }

    it { expect(response).to be_success }
    it { expect(assigns :tryout).to be_a_new Tryout }
  end

  describe "POST create" do
    context "not signed in" do
      context "new user" do
        let(:email) { 'student@lol.lol' }
        before { post :create, email: email, answers: {} }

        it { expect(Student.exists? email: email).to be }
        it { expect(Student.where(email: email).first.tryouts).to have(1).item }
        it { expect(response).to redirect_to(invite_user_path email: email) }
      end

      context "registered user" do
        let(:student) { create :student }
        before { post :create, email: student.email, answers: {} }

        it { expect(student.tryouts).to have(1).item }
        it { expect(response).to redirect_to new_session_path }
      end
    end

    context "signed in" do
      let(:student) { create :student }
      before do
        session[:user_id] = student.id
        post :create, answers: {}
      end

      it { expect(student.tryouts).to have(1).item }
    end
  end

end
