Devolute::App.controllers :sessions do

  get :new, :map => "/login" do
    render 'application/index'
  end

  post :create do
    if account = Account.authenticate(params[:email], params[:password])
      sign_in(account)
      redirect '/'
    else
      redirect '/login'
    end
  end

  get :destroy, :map => '/logout' do
    sign_out
    flash[:notice] = "You have successfully logged out."
    redirect '/'
  end
end
