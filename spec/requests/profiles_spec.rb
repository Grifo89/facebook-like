require 'rails_helper'

RSpec.describe ProfileController, type: :request do
  let(:user){User.create(email: 'edem@gmail.com', password: '111111')}
    # before do
    #   sign_in user
    #   get :index
    # end
    # describe "GET /profiles" do
    #   it "works! (now write some real specs)" do
    #     get '/'
    #     expect(response).to have_http_status(200)
    #   end
    # end
  
  
end
