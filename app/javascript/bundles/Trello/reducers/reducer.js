import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';
import lists from './lists/listsReducer';
import cards from './cards/cardReducer';

const reducer = combineReducers({ lists, form: formReducer });

export default reducer;
