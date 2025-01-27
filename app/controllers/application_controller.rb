class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get "/categories" do
    categorization = Categorization.all

    categorization.to_json(
      include: :tasks
    )
  end

  post "/categories" do 
    categorisation = Categorization.create(
      name: params[:name]
    )
    categorisation.to_json(
      include: :tasks
    )
  end 

  post "/categories/:category_id/tasks" do
    new_task = Task.create(
      name: params[:name],
      description: params[:description],
      categorization: Categorization.find(params[:category_id])
    )
    new_task.to_json
  end 

  delete "/categories/:id" do
    categorization = Categorization.find(params[:id])
    categorization.destroy
  end 

  delete "/tasks/:id" do 
    task = Task.find(params[:id])
    task.destroy

  end 

  patch "/tasks/:id" do 
    task = Task.find(params[:id])
    task.update(
      description: params[:description]
    )
    task.to_json
  end 



end
