import React from 'react';
import PropTypes from 'prop-types';
import List from '../List/List';

const Lists = ({ lists }) => (
  <div className='lists-container'>
    {lists.map(list => <List list={list} />)}
  </div>
)

Lists.propTypes = {
  lists: PropTypes.array.isRequired
}

export default Lists