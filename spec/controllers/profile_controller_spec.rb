require 'rails_helper'

describe ProfileController, type: :controller do
  it_behaves_like "Authenticatable"

  before do
    @student = create(:student)
    session[:user_id] = @student.id
  end

  describe "GET share_profile" do
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
