# Routes

## API Endpoints

### `users`
- `GET /api/users` - returns the user information for the User Search feature
- `POST /api/users` - sign up
- `PATCH /api/users/:id` - edit a user


### `projects`
- `GET /api/projects` - returns relevant projects (filtered by `data/params`)
- `GET /api/projects/:id` - return project
- `POST /api/projects` - creates a project
- `PATCH /api/projects/:id` - edit a project
- `DELETE /api/projects/:id` - remove a project

### `steps`
- `GET /api/steps` - returns relevant steps (filtered by `data/params`)
- `POST /api/steps` - creates a step
- `DELETE /api/steps`

### `comments`
- `GET /api/comments` - return relevant comments (filtered by `data/params`)
- `POST /api/comments` - creates a comment
- `PATCH /api/comments/:id` - edit a comment


----

## Frontend Routes
- `/login`
- `/signup`
- `/` - homepage, project feed
- `/projects/new` - create a project
- `/projects/:projectId` - project show
- `/projects/:projectId/edit` - update a project
- `/projects/:projectId/steps/new` - create a step
- `/projects/:projectId/steps/:stepId` - step show
- `/projects/:projectId/steps/:stepId/edit` - update step
