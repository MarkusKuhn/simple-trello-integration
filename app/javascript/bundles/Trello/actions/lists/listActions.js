import { GET_LISTS, GET_LISTS_SUCCESS, GET_LISTS_FAILURE } from '../../constants/lists/listConstants';

export const getLists = () => ({
  type: GET_LISTS,
  payload: {},
});

export const getListsSuccess = lists => ({
  type: GET_LISTS_SUCCESS,
  lists
})

export const getListsFailure = () => ({
  type: GET_LISTS_FAILURE,
  payload: {}
})

export function fetchLists() {
  return function(dispatch) {
    dispatch(getLists());

    return fetch('/api/lists')
      .then(response => response.json(), error => console.log('An error occurred ', error))
      .then(json => dispatch(getListsSuccess(json)))
  }
}