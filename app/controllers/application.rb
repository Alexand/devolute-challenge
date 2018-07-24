Devolute::App.controllers :application do
  before do
    return redirect '/login' unless (signed_in? || ENV["RACK_ENV"] == "test")
  end

  get :index, :map => '/' do
    @title = 'Index'
    @ng_app = "app"
    render 'index'
  end
end
