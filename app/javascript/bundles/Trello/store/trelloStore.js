import { createStore, applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';
import reducer from '../reducers/reducer';

const configureStore = (railsProps) => (
  createStore(reducer, applyMiddleware(thunkMiddleware))
);

export default configureStore;
