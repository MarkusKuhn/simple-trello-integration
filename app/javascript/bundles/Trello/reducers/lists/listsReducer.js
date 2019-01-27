import { combineReducers } from 'redux';
import { GET_LISTS, GET_LISTS_SUCCESS, GET_LISTS_FAILURE } from '../../constants/lists/listConstants';

const lists = (state = {}, action) => {
  switch (action.type) {
    case GET_LISTS:
      return state;
    case GET_LISTS_SUCCESS:
      return { ...state, lists: action.lists }
    case GET_LISTS_FAILURE:
      return state
    default:
      return state;
  }
};

export default lists