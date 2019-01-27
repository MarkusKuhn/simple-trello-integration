import { createStore } from 'redux';
import reducer from '../reducers/reducer';

const configureStore = (railsProps) => (
  createStore(reducer, railsProps)
);

export default configureStore;
