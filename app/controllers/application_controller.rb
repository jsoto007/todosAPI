class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get "/categories" do
    categorization = Categorization.all

    categorization.to_json(
      include:{tasks: {only: [:description, :id, :created_at, :categorization_id, :updated_at]}}
    )
  end

  #not using
  # get "/tasks" do 
  #   task = Task.all.limit(10)
  #   task.to_json
  # end 

  post "/tasks" do 
    #make it using the collection methods
    # found_categorization = Categorization.find(params[:id])
    # found_categorization.tasks.create(
    #   name: params[:name],
    #   description: params[:description]
    # )

    # found_categorization.to_json(
    #   include:{tasks: {only: [:description, :id]}}
    # )
    task = Task.create(
      name: params[:name],
      description: params[:description],
      categorization_id: params[:categorization_id]
    )

    task.to_json
  end

#not using
  delete "/categories/:id" do
    categorization = Categorization.find(params[:id])
    categorization.tasks.destroy
    categorization.destroy
    #also destroy all dependencies
    # categorization.to_json
  end 

  delete "/tasks/:id" do 
    task = Task.find(params[:id])
    task.destroy
    # task.to_json
  end 

  patch "/tasks/:id" do 
    task = Task.find(params[:id])
    task.update(
      description: params[:description]
    )
   
    task.to_json
  end 



end
