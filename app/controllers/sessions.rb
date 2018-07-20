Devolute::App.controllers :sessions do

  get :new, :map => "/login" do
    render 'index'
  end

  post :create do
    if Account.authenticate(params[:email], params[:password])
      redirect '/main'
    else
      render 'index'
    end
  end

  get :destroy, :map => '/logout' do
  end
end
