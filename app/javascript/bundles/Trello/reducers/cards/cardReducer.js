import { combineReducers } from 'redux';
import { CREATE_CARD, CREATE_CARD_SUCCESS, CREATE_CARD_FAILURE } from '../../constants/cards/cardConstants';

const cards = (state = {}, action) => {
  switch (action.type) {
    case CREATE_CARD:
      return { ...state, submitting: true, submitComplete: false };
    case CREATE_CARD_SUCCESS:
      return { ...state, submitting: false, submitComplete: true }
    case CREATE_CARD_FAILURE:
      return { ...state, submitting: false, submitComplete: true }
    default:
      return state;
  }
};

export default cards