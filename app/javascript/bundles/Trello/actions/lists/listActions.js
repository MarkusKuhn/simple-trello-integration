import { GET_LISTS, GET_LISTS_SUCCESS, GET_LISTS_FAILURE } from '../../constants/lists/listConstants';

export const getLists = () => ({
  type: GET_LISTS,
  payload: {},
});

export const getListsSuccess = ({ payload }) => ({
  type: GET_LISTS_SUCCESS,
  payload
})

export const getListsFailure = () => ({
  type: GET_LISTS_FAILURE,
  payload: {}
})