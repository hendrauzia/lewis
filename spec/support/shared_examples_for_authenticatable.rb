shared_examples "Authenticatable" do
  context "not signed in" do
    it "redirected to login page" do
      expect(get 'index').to redirect_to(new_session_path)
    end
  end
end
