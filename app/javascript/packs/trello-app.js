import ReactOnRails from 'react-on-rails';

import TrelloApp from '../bundles/Trello/startup/TrelloApp';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  TrelloApp,
});
