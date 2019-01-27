import { combineReducers } from 'redux';
import lists from './lists/listsReducer.js';

const reducer = combineReducers({ lists });

export default reducer;
