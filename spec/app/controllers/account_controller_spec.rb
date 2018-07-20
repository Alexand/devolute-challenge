require 'spec_helper'

RSpec.describe "/account" do
  describe "POST /account" do
    context "without a body" do
      before do
        post "/account"
      end

      it "returns hello world" do
        expect(last_response.status).to eq 400
      end
    end

    context "with valid data" do
      before do
        post "/account", {
          account: {
            name: "devolute",
            email: "devolute@devolute.com",
            password: "fooBarr",
            password_confirmation: "fooBarr"
          }
        }
      end

      it "returns hello world" do
        expect(last_response.status).to eq 200
      end
    end
  end

  xit "with" do
    expect(last_response.body).to eq "Hello World"
  end
end
