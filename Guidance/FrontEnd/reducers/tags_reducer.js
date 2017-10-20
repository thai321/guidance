import { RECEIVE_TAGS } from '../actions/tag_actions';

const TagsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_TAGS:
      return Object.assign({}, action.tags);
    default:
      return state;
  }
};

export default TagsReducer;
