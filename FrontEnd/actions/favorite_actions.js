import * as FavoriteApiUtil from '../util/favorite_api_util';

export const RECEIVE_FAVORITE = 'RECEIVE_FAVORITE';
export const REMOVE_FAVORITE = 'REMOVE_FAVORITE';

const receiveFavorite = favorite => ({
  type: RECEIVE_FAVORITE,
  favorite
});

const removeFavorite = favorite => ({
  type: REMOVE_FAVORITE,
  favorite
});

export const createFavorite = favorite => dispatch =>
  FavoriteApiUtil.createFavorite(favorite).then(fav =>
    dispatch(receiveFavorite(fav))
  );

export const deleteFavorite = favorite => dispatch =>
  FavoriteApiUtil.deleteFavorite(favorite).then(fav =>
    dispatch(removeFavorite(fav))
  );
