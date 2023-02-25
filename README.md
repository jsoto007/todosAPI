# About
This is a tasks database using the following models: Categorization has_many: tasks and Tasks belongs_to :Categorization. This API sends back JSON formatted data. Categorization allows read and delete requests. And tasks allow full CRUD.


## Requirements to install and run this program.
- task-frontend, a react app built to work with this API. The link is in the instructions. 
- Ruby
- Access to a terminal. 
- Internet browser. 

## Instructions
- Open and copy the repo from GitHub.
- Open the terminal and navigate to the directory you want to clone the program.
- Use the `git clone` command, paste the GitHub repo, and press enter.
- CD (change directory) into the file.
- Open the file.
- Run `buldle install` in the terminal to install all dependencies. 
- This Web-App is meant to work with a front-end React.js APP found HERE: `https://github.com/jsoto007/task-frontend`
- Follow the instructions in the `todos-frontend` or use a frontend of your choice. 
- Run  `rake server` in your terminal to start the server and open `http://localhost:9292/categories` in your internet browser to see the data.

## Working With this API

###fetch: read
`http://localhost:9292/categories`
When making a fetch request, the todosAPI will return a JSON-formatted object like the one below:
This object will include all categories and their corresponding tasks. 

```
{
"id": 7,
"name": "drive wireless solutions",
"created_at": "2023-02-17T16:57:57.766Z",
"updated_at": "2023-02-17T16:57:57.766Z",
"tasks": [
{
"id": 25,
"name": null,
"description": "Omnis dicta qui incidunt.",
"categorization_id": 7,
"created_at": "2023-02-17T16:57:57.800Z",
"updated_at": "2023-02-17T16:57:57.800Z"
},
{
"id": 35,
"name": null,
"description": "Voluptas deserunt beatae et.",
"categorization_id": 7,
"created_at": "2023-02-17T16:57:57.807Z",
"updated_at": "2023-02-17T16:57:57.807Z"
},
{
"id": 217,
"name": "Meeting with charlie",
"description": "Meet with charlie about the different plans he got",
"categorization_id": 7,
"created_at": "2023-02-22T06:40:00.350Z",
"updated_at": "2023-02-22T06:40:00.350Z"
}
]
}
```

A POST request for a new Category can be sent to the same URL. 

##### NOTE: The first part of the URLs below is `http://localhost:9292/` or the port of your choice. 

###DELETE category
To delete a category, the user can send a request to `/categories/:id` with the `:id` being the dynamic part of the URL. 
This request will delete the given category and all associated tasks. 

###POST tasks

To post a new task, the user can send a request to `/categories/:category_id/tasks` The :category_id is the dynamic part of the URL. This request will persist a new task to the database and will associate the task to the category by using Active Record associations. 


#### tasks DELETE / PATCH
The DELETE or PATCH are sent to `/tasks/:id` :id being the dynamic part of the URL. Both requests can be sent to the same URL and will execute depending on the structure of the fetch request. 

## Technologies
- Ruby 
- Active Record
- HTML

### Resources #

Faker was used to generate fake data: 
https://github.com/faker-ruby/faker

Active record migrations: 
https://guides.rubyonrails.org/active_record_migrations.html

Active Record associatoins: 
https://guides.rubyonrails.org/association_basics.html

