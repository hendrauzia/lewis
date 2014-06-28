require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe "#authenticated" do
    context "not authenticated" do
      it "returns false" do
        session[:user_id] = nil
        expect(helper.authenticated).to be(false)
      end
    end
    context "authenticated" do
      it "returns false" do
        session[:user_id] = 999
        expect(helper.authenticated).to be(true)
      end
    end
  end
end
