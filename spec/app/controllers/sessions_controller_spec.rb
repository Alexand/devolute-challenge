require 'spec_helper'

RSpec.describe "/sessions" do
  describe "GET /login" do
    it "load the login page" do
      get "/login"
      expect(last_response).to be_ok
    end
  end

  describe "POST :create" do
    let(:account) { build(:account)}
    let(:params) { attributes_for(:account)}

    it "stay on page if account is not found" do
      expect(Account).to receive(:authenticate).and_return(nil)
      post 'sessions/create'
      expect(last_response).to be_ok
    end

    it "stay on login page if account has wrong password" do
      account.password = "fake"
      expect(Account).to receive(:authenticate).and_return(nil)
      post 'sessions/create', {:password => 'correct'}
      expect(last_response).to be_ok
    end

    it "redirects to home if correct email and password" do
      account.password = 'real'
      expect(Account).to receive(:authenticate).and_return(account)
      post 'sessions/create', {:password => 'real', :remember_me => false}
      expect(last_response).to be_redirect
    end
  end

  describe "GET /logout" do
    it "empty the current session" do
      get '/logout'
      expect(last_request.env['rack.session'][:current_account]).to be_nil
    end

    it "redirect to homepage if account is logging out" do
      get '/logout'
      expect(last_response).to be_redirect
    end
  end
end
