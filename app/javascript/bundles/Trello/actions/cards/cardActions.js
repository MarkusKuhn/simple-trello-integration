import { CREATE_CARD, CREATE_CARD_SUCCESS, CREATE_CARD_FAILURE } from '../../constants/cards/cardConstants';

export const createCard = () => ({
  type: CREATE_CARD,
  payload: {},
});

export const createCardSuccess = () => ({
  type: CREATE_CARD_SUCCESS,
  payload: {}
})

export const createCardFailure = error => ({
  type: CREATE_CARD_FAILURE,
  payload: {}
})

export function postCreateCard(values) {
  return function(dispatch) {
    dispatch(createCard());

    return fetch('/api/cards', { body: JSON.stringify(values), headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }, method: "POST" })
      .then(response => response.json(), error => dispatch(createCardFailure('An error occurred ', error)))
      .then(json => dispatch(createCardSuccess()))
  }
}