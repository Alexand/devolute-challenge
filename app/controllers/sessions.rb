Devolute::App.controllers :sessions do

  get :new, :map => "/login" do
    render 'session/login'
  end

  post :create do
    if account = Account.authenticate(params[:email], params[:password])
      sign_in(account)
      redirect '/'
    else
      redirect '/login', notice: "Email and password combination are not valid!"
    end
  end

  get :destroy, :map => '/logout' do
    sign_out
    flash[:notice] = "You have successfully logged out."
    redirect '/'
  end
end
