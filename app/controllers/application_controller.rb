class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get "/categories" do
    categorization = Categorization.all

    categorization.to_json(
      include:{tasks: {only: [:description, :id]}}
    )
  end

  get "/tasks" do 
    task = Task.all.limit(10)
    task.to_json
  end 

  post "/categories" do
    categorization = Categorization.find(params[:id]).tasks.create(
      name: params[:name],
      description: params[:description],
    )
    new_task = Categorization.find(params[:id])
    new_task.to_json(
      include:{tasks: {only: [:description, :id]}}
    )
  end 

#not using at the momment to be deleted 
  post "/tasks" do 
    task = Task.create(
      name: params[:name],
      description: params[:description],
      categorization_id: params[:categorization_id]
    )
    task.to_json
  end

  delete "/categories/tasks/:id" do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

  delete "/categories/:id" do
    categorization = Categorization.find(params[:id])
    categorization.destroy
    categorization.to_json
  end 

  delete "/tasks/:id" do 
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end 

  patch "/tasks/:id" do 
    task = Task.find(params[:id])
    task.update(
      description: params[:description]
    )
    task.to_json
  end 







end
