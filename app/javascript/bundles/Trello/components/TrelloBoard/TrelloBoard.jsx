import React, { Component } from 'react';
import Lists from '../Lists/Lists';
import PropTypes from 'prop-types';


class TrelloBoard extends Component {
  componentWillMount() {
    this.props.fetchLists()
  }

  render() {
    const { lists } = this.props;

    return (
      <div className="board">
        <h1>Simple Trello Integration</h1>
        <div className="lists">
          <h2>Lists</h2>
          <Lists lists={lists} />
        </div>
      </div>
    )
  }
}

TrelloBoard.propTypes = {
  lists: PropTypes.array,
  fetchLists: PropTypes.func.isRequired
};

export default TrelloBoard;
