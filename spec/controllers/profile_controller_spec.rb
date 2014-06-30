require 'rails_helper'

describe ProfileController, type: :controller do
  it_behaves_like "Authenticatable"

  context "parent" do
    before do
      @parent = create(:parent)
      session[:user_id] = @parent.id
    end

    it "returns https success" do
      get 'index'
      expect(response).to be_success
    end
  end

  context "student" do
    before do
      @student = create(:student)
      session[:user_id] = @student.id
    end

    it "returns https success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET share_profile" do
    before do
      @student = create(:student)
      session[:user_id] = @student.id
    end

    it "returns http success" do
      get 'share'
      expect(response).to be_success
    end

    describe "POST notify_profile" do
      it "redirects to profile" do
        post 'notify'
        expect(response).to redirect_to(profile_path)
      end
    end
  end
end
