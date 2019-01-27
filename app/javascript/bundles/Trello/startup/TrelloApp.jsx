import React from 'react';
import { Provider } from 'react-redux';

import configureStore from '../store/trelloStore';
import TrelloContainer from '../containers/Trello/TrelloContainer';

const TrelloApp = (props) => (
  <Provider store={configureStore(props)}>
    <TrelloContainer />
  </Provider>
);

export default TrelloApp;
