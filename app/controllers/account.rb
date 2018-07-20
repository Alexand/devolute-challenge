Devolute::App.controllers :account, :provides => [:html, :json] do

  get :new, :map => "/register" do
    @account = Account.new
    render 'new'
  end

  # post :authenticate do
  #
  # end

  post "/" do
    begin
      params[:account].merge!(role: :user)
      @account = Account.new(params[:account])

      unless @account.valid?
        flash.now[:error] = @account.errors
        return redirect('/register')
      else
        byebug
        @account.save
        sign_in(@account)
        redirect('/')
      end

      @account.save
    rescue StandardError => ex
      status 400
    end
  end
end
