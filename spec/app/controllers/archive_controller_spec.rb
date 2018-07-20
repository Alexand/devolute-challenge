require 'spec_helper'

RSpec.describe "/archive" do
  pending "add some examples to #{__FILE__}" do
    before do
      get "/archive"
    end

    it "returns hello world" do
      expect(last_response.body).to eq "Hello World"
    end
  end
end
