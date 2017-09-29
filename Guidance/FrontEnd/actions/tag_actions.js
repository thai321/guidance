import * as TagApiUtil from '../util/tag_api_util';

export const RECEIVE_TAGS = 'RECEIVE_TAGS';

const receiveTag = tags => ({
  type: RECEIVE_TAGS,
  tags
});

export const fetchTags = () => dispatch =>
  TagApiUtil.fetchTags().then(tags => dispatch(receiveTag(tags)));
