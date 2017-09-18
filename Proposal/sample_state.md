# Sample State

- **`entities:`** **Object** mixture of relational and non-relational data
  - **`projects:`** **Object** that hold the project's
    - **id**
    - **title**
    - **description**
    - **img_url**
    - **video_url**
    - **published**
    - **author_id**
    - **step_ids:** **Array** of **steps** belong to project
    - **comment_ids:** **Array** of **comments** belong to project
    - <u>**allIds:**</u> All Ids of projects
  - **`users:`** **Object** that hold user's
    - **id**
    - **username**
    - **img_url**
    - **project_ids:** **Array** of **projects** belong to user
    - <u>**allIds:**</u> All Ids of users
  - **`steps:`** **Object** that hold the step's
    - **id**
    - **title**
    - **body**
    - <u>**allIds:**</u> All Ids of steps
  - **`comments:`** **Object** that hold the comment's
    - **id**
    - **body**
    - **author_id**
    - <u>**allIds:**</u> All Ids of comments
- **`ui:`** **Object** that hold user interface data
  - **`loading:`** value can be **true or false**, default to false
- **`errors:`** **Object** of errors which is sent back from the server
  - <u><i>login:</i></u>  **array** of errors messages from server
  - <u><i>projectForm:</i></u>  **array** of errors messages from server
  - <u><i>stepForm:</i></u> **array** of errors messages from server
  - <u><i>commentForm:</i></u> **array** of errors messages from server
- **`session:`** **Object** of authencation information
  - **`curentUser:`** ** Object of a user who is logged in or just signned up

```js
{
  entities: {
    projects: {
      1: {
        id: 1,
        title: 'Project1',
        description: 'description 1'
        img_url: 'https://images...',
        video_url: 'https://videos...',
        published: true,
        author_id: 3,
        step_ids: [1, 2, 3],
        comment_ids: [1, 2]
      },
      2: {
        id: 2,
        title: 'Project2',
        description: 'description 2'
        img_url: 'https://images...',
        video_url: 'https://videos...',
        published: false,
        author_id: 4,
        step_ids: [4, 5],
        comment_ids: [3, 4, 5]
      },
      3: {
        id: 3,
        title: 'Project1',
        description: 'description 1'
        img_url: 'https://images...',
        video_url: 'https://videos...',
        published: true,
        author_id: 2,
        step_ids: [6,7],
        comment_ids: [6, 7, 8]
      },

      allIds: [1, 2, 3]
    }, // end projects

    users: {
      2: {
        id: 2,
        username: 'Cat 2',
        img_url: 'https://images...',
        project_ids: [3]
      },
      3: {
        id: 3,
        username: 'Cat 3',
        img_url: 'https://images...',
        project_ids: [1]
      },
      4: {
        id: 4,
        username: 'Cat 4',
        img_url: 'https://images...',
        project_ids: [2]
      },

      allIds: [2, 3, 4]
    }, // end users

    steps: {
      1: {
        id: 1,
        title: 'Project 1 Step 1',
        body: 'Project 1 Step 1 do ...'
      },
      2: {
        id: 2,
        title: 'Project 1 Step 2',
        body: 'Project 1 Step 2 do ...'
      },
      3: {
        id: 3,
        title: 'Project 1 Step 3',
        body: 'Project 1 Step 3 do ...'
      },
      4: {
        id: 4,
        title: 'Project 2 Step 1',
        body: 'Project 2 Step 1 do ...'
      },
      5: {
        id: 5,
        title: 'Project 2 Step 2',
        body: 'Project 2 Step 2 do ...'
      },
      6: {
        id: 6,
        title: 'Project 3 Step 1',
        body: 'Project 3 Step 1 do ...'
      },
      7: {
        id: 7,
        title: 'Project 3 Step 2',
        body: 'Project 3 Step 2 do ...'
      },

      allIds: [1, 2, 3, 4, 5, 6, 7]
    }, // end steps

    comments: {
      1: {
        id: 1,
        body: 'Project 1 comment 1 by User 2',
        author_id: 2
      },
      2: {
        id: 2,
        body: 'Project 1 comment 2 by User 3',
        author_id: 3
      },
      3: {
        id: 3,
        body: 'Project 2 comment 3 by User 4',
        author_id: 4
      },
      4: {
        id: 4,
        body: 'Project 2 comment 4 by User 2',
        author_id: 2
      },
      5: {
        id: 5,
        body: 'Project 2 comment 5 by User 3',
        author_id: 3
      },
      6: {
        id: 6,
        body: 'Project 3 comment 6 by User 4',
        author_id: 4
      },
      7: {
        id: 7,
        body: 'Project 3 comment 7 by User 2',
        author_id: 2
      },
      8: {
        id: 8,
        body: 'Project 3 comment 8 by User 3',
        author_id: 3
      },

      allIds: [1, 2, 3, 4, 5, 6, 7, 8]
    } // end comments
  }, // end entities

  ui: {
    loading: true/false
  }, // end ui

  errors: {
    login: ['Incorrect username/password combination'],
    projectForm: ["title/description can't be blank"],
    stepForm: ["title/body can't be blank"],
    commentForm: ["body can't be blank"]
  }, // end errors

  session: {
    currentUser: {
      id: 77,
      username: 'thai',
      img_url: 'https://...thai.jpg'
    }
  } // end errors
} // end data packpage object
```
