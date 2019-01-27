import React, { Component } from 'react';
import PropTypes from 'prop-types';


class TrelloBoard extends Component {
  render() {
    return (
      <div className="board">
        <h1>Simple Trello Integration</h1>
      </div>
    )
  }
}

TrelloBoard.propTypes = {
  lists: PropTypes.array
};

export default TrelloBoard;
