require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # Include Devise test helpers
  include Devise::Test::ControllerHelpers

  describe "GET #index" do
    context "when user is not logged in" do
      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is logged in" do
      let(:current_user) { User.create!(email: 'test@example.com', password: 'password') }

      before do
        sign_in current_user
        binding.pry
      end

      it "renders the index template" do
        get :index

        expect(response).to render_template(:index)
      end
    end
  end
end
