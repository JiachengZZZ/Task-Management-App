require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryBot.create(:user, email: 'user@example.com', password: 'password') }

  describe "Get response from new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "login" do
    context "with valid credentials" do
      it "logs in the user and redirects to the tasks path" do
        post :create, params: { session: { email: user.email, password: user.password } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(tasks_path)
      end
    end

    context "with invalid credentials" do
      it "does not log in the user and re-renders the new template" do
        post :create, params: { session: { email: user.email, password: 'wrong' } }
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
      end
    end
  end

  describe "delete the current session" do
    it "logs out the user and redirects to the root url" do
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_url)
    end
  end
end
