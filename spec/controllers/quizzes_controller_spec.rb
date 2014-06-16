require 'rails_helper'

describe QuizzesController, type: :controller do

  describe "GET 'show'" do
    context "valid quiz" do
      it "returns http success" do
        quiz = create(:quiz)
        get :show, id: quiz.id
        expect(response).to be_success
      end
    end
    context "invalid quiz" do
      it "raise ActiveRecord::RecordNotFound" do
        expect{ get :show, id: 999 }.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "unpublished quiz", focus: true do
      it "raise ActiveRecord::RecordNotFound" do
        quiz = create(:quiz)
        quiz.update_attribute(:published, false)
        expect{ get :show, id: quiz.id }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
