# React Component Hierarchy

## Functional Component Hierarchy
- `Root`
  - `App`
    - `NavBar`
    - `Main`
    - `Footer`

## NavBar
- `NavBar`
  - Components:
    - `SessionButtonsContainer` + `SessionButtons`
      - **State:** `session`
    - `SearchProjectsContainer` + `SearchProjects`
      - **State:** `entities.projects`

**Note:** All other components are rendered inside of `MainPage`

## Users
- `UserIndexContainer` + `UserIndex`
  - **Route:** `/users/currentUser.id`
  - **State:** `projects:` `fetchProjectsByUser(state, currentUser.id)`
  - Components:
    - `UserIndexItem`
      - **State:** `project`


## Projects
- `ProjectIndexContainer` + `ProjectIndex`
  - **Route:** `/`
  - **State:** `entities.projects`
  - **Dispatch:** `projects:` `fetchAllProjects`
  - Components:
    - `ProjectItem`
      - **State:** `project`

- `ProjectShowContainer` + `ProjectShow`
  - **Route:** `/projects/:projectId`
  - **State:**
    - **project:** `entities.projects[:id]`
    - **steps:**`entities.projects[:id].step_ids`
    - **comments:**`entities.projects[:id].comment_ids`
    - **ui:** `state.ui`
  - Components:
    - `StepItem`
      - **State:** `step`
    - CommentShow:
      - **State:** `comments`, `projectId`(from url)
      - Components:
        - `CommentFormContainer` + `CommentForm`
          - **State:** `state.errors.commentForm`
          - **Dispatch** `updateProject(project)`
        - `CommentItem`
          - **State:** `comment` (each comment have author_id)


- `ProjectFormContainer` + `ProjectForm`
  - **Route:** `/projects/new`
  - **Dispatch:** `createProject(project)`
  - **State:**
    - `state.errors.projectForm`
  - Component:
    - `StepFormContainer` + `StepForm`
      - **Route:** `projects/:projectId/steps/new`
      - **Dispatch:** `updateProject(project)`
      - **State:**
        - `state.errors.stepForm`


- `ProjectEditContainer` + `ProjectEdit`
  - **Route:** `/projects/:projectId/edit`
  - **Dispatch:** `updateProject(project)`
  - **State:**
    - `state.errors.projectForm`
    - **steps:**`entities.projects[:id].step_ids`
  - Component:
    - `Steps`
      - **State:** `steps`
    - `StepFormContainer` + `StepForm`
      - **Route:** `project/:projectId/steps/new`
      - **Dispatch:** `updateProject(project)`
      - **State:**
        - `state.errors.stepForm`

## Steps
- `StepFormContainer` + `StepForm`
  - **Route:** `project/:projectId/steps/new`
  - **Dispatch:** `updateProject(project)`
  - **State:**
    - `state.errors.stepForm`

- `StepEditContainer` + `StepEdit`
  - **Route:** `project/:projectId/steps/:stepId/edit`
  - **Dispatch:** `updateProject(project)`
  - **State:**
    - `state.errors.stepForm`


## Session
- `SessionFormContainer` + `SessionForm`
  - **Route:** `/login` and `/signup`
  - **State:** `errors.login`


## Project Search
- `ProjectSearchContainer` + `ProjectSearch`
  - **Route:** '/'
  - State: `ui`
  - Components:
    - `ProjectSearchIndex`
    - **State:** none (will be made with separate ajax)
      - Components:
        - `ProjectSearchIndexItem`
          - **State:** none (will be made with separate ajax)
