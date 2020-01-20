require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
  let(:user){User.create(email: 'edem@gmail.com', password: '111111')}
    before do
      sign_in user
    end
    context "When the user logs in" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
end
