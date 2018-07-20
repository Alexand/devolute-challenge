Devolute::App.controllers :archive do
  before do
    redirect '/login' unless (signed_in? || ENV["RACK_ENV"] == "test")
  end

  get "/my" do
    Archive.where(account_id: current_account[:id])
      .select(:name, :path)
      .all
      .map(&:values)
      .to_json
  end

  post '/upload' do
    if params[:file]
      @uploader = ::FileUploader.new(:store)
      uploaded_file = @uploader.upload(params[:file]["tempfile"])
      Archive.create(
        name: params[:file][:filename],
        path:FileUploader.s3_path(uploaded_file.id),
        account_id: current_account[:id]
      )
    end

    { status: 200 }.to_json
  end
end
