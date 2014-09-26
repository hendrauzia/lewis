require 'rails_helper'

describe ProfileController do
  it_behaves_like "Authenticatable"

  context "parent" do
    let(:parent) { create :parent }
    before { session[:user_id] = parent.id }

    describe "GET index" do
      before { get :index }

      it { expect(response).to be_success }
    end
  end

  context "student" do
    let(:student) { create :student }
    before(:each) { session[:user_id] = student.id }

    describe "GET index" do
      before { get :index }

      it { expect(response).to be_success }
    end

    describe "GET share_profile" do
      before { get :share }

      it { expect(response).to be_success }
    end

    describe "POST notify_profile" do
      context "email not registered" do
        before { post :notify }

        it { expect(response).to redirect_to profile_path }
      end

      context "email has been registered" do
        let(:email) { Faker::Internet.email }
        before { post :notify, email: email }

        it { expect(student.parents.exists? email: email).to be }
      end
    end
  end
end
