# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileController, type: :controller do
<<<<<<< HEAD
=======
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
>>>>>>> 212e35abad832a227a6c78546f390f22e4736cd1
end
