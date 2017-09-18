# Database Schema

## `users`

| **column name** 	| **data type** 	| **details**               	|
|-----------------	|---------------	|---------------------------	|
| `id`              	| integer       	| not null, primary key     	|
| `username`        	| string        	| not null, indexed        	|
| `img_url`         	| string        	| not null                  	|
| `password_digest` 	| string        	| not null                  	|
| `session_token`   	| string        	| not null, indexed, unique 	|
| `created_at`      	| date time     	| not null                  	|
| `updated_at`      	| datetime      	| not null                  	|

- has_many `:projects`
- has_many `:comments`


## `projects`

| **column name** 	| **data type** 	| **details**                                       	|
|-----------------	|---------------	|---------------------------------------------------	|
| `id`              	| integer       	| not null, primary key                             	|
| `title`           	| string        	| not null, indexed                                 	|
| `description`     	| text          	| not null                                          	|
| `image_url`       	| string        	| not null                                          	|
| `video_url`       	| string        	| not null                                          	|
| `published`       	| boolean       	| not null, default: false, includes: [true, false] 	|
| `author_id`       	| integer       	| not null, indexed, foreign key                    	|
| `created_at`      	| date time     	| not null                  	|
| `updated_at`      	| datetime      	| not null                  	|

- `author_id` references `users`


- belongs_to `:user`
- has_many `:steps`
- has_many `:comments`




## `steps`

| **column name** 	| **data type** 	| **details**                    	|
|-----------------	|---------------	|--------------------------------	|
| `id`              	| integer       	| not null, primary key          	|
| `title`           	| string        	| not null                       	|
| `body`             	| text          	| not null                       	|
| `project_id`      	| integer       	| not null, indexed, foreign key 	|
| `created_at`      	| date time     	| not null                  	|
| `updated_at`      	| datetime      	| not null                  	|

- `project_id` references `projects`

- belongs_to `:project`

## `comments`

| **column name** 	| **data type** 	| **details**                    	|
|-----------------	|---------------	|--------------------------------	|
| `id`              	| integer       	| not null, primary key          	|
| `body`            	| string        	| not null                       	|
| `author_id`         	| integer       	| not null, indexed, foreign key          	|
| `project_id`      	| integer       	| not null, indexed, foreign key 	|
| `created_at`      	| date time     	| not null                  	|
| `updated_at`      	| datetime      	| not null                  	|

- `author_id` references `users`
- `project_id` references `projects`
- index on `[:project_id, :author_id], unique: true`


- belongs_to `:user`
- belongs_to `:project`
