import React, { Component } from 'react';
import Lists from '../Lists/Lists';
import CardForm from '../CardForm/CardForm';
import PropTypes from 'prop-types';


class TrelloBoard extends Component {
  componentWillMount() {
    this.props.fetchLists()
  }

  handleSubmit = (values) => {
    this.props.postCreateCard(values)
  }

  render() {
    const { lists, submitting } = this.props;

    return (
      <div className="board">
        <h1>Simple Trello Integration</h1>
        <div className="lists">
          <h2>Lists</h2>
          <Lists lists={lists} />
          <CardForm onSubmit={this.handleSubmit} submitting={submitting} />
        </div>
      </div>
    )
  }
}

TrelloBoard.propTypes = {
  lists: PropTypes.array,
  submitting: PropTypes.bool,
  fetchLists: PropTypes.func.isRequired,
  postCreateCard: PropTypes.func.isRequired
};

export default TrelloBoard;
