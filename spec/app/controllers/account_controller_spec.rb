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
        expect(last_response.status).to eq 302
      end
    end
  end
end
