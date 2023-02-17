class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get "/categories" do
    categorization = Categorization.all

    categorization.to_json(
      include:{tasks: {only: [:description, :id]}}
    )
  end

  #not using
  # get "/tasks" do 
  #   task = Task.all.limit(10)
  #   task.to_json
  # end 

  post "/tasks" do 
    #make it using the collection methods
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
    categorization.Tasks.destroy
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
