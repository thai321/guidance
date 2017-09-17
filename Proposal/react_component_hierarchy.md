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
      - **State**: `session`
    - `SearchProjectsContainer` + `SearchProjects`
      - **State**: `entities.projects`

**Note:** All other components are rendered inside of `MainPage`

## Projects
- `ProjectIndexContainer` + `ProjectIndex`
  - **Route:** `/`
  - **State:** `entities.projects`
  - **Dispatch:** `fetchAllProjects`
  - Components:
    - `ProjectItem`
      - **State:** `entities.projects[:id]`

- `ProjectShowContainer` + `ProjectShow`
  - **Route:** `/projects/:projectId`
  - **State:**
    - **project:** `entities.projects[:id]`
    - **steps:**`entities.projects[:id].step_ids`
    - **comments:**`entities.projects[:id].comment_ids`
    - **ui:** `state.ui`
  - Components:
    - `Steps`
      - **State:** `steps`
    - `CommentFormContainer` + `CommentForm`
      - **State:** `state.errors.commentForm`
      - **Dispatch** `updateProject(project)`
    - `ProjectComments`
      - **State:** `comments` (each comment have author_id)


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


## Project Search
- `ProjectSearchIndexContainer` + `ProjectSearchIndex`
  - **Route:** '/'
  - State: `ui`
  - Components:
    - `ProjectSearchIndexItem`
    - **State:** none (will be made with separate ajax)
