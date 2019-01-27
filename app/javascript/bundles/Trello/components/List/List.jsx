import React from 'react';
import PropTypes from 'prop-types';

const List = ({ list }) => (
  <div className='list-item' key={list.id}>
    <div className="list-details">{list.name}</div>
  </div>
)

export default List