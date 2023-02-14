class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get "/categories" do
    categorization = Categorization.all.limit(10)

    categorization.to_json(
      include:{tasks: {only: [:description]}}
    )
  end

  post "/tasks" do 
    task = Task.create(
      name: params[:name],
      description: params[:description],
      categorization_id: params[:categorization_id]
    )
    task.to_json
  end





end
