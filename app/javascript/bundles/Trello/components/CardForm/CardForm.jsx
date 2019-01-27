import React from 'react';
import { reduxForm, Field } from 'redux-form';

const CardForm = ({ handleSubmit, submitting, createdSuccess }) => (
  <div className="form-container">
    <h2>Create a new card</h2>
    <div className="form">
      <form onSubmit={handleSubmit}>
        <Field name="name" component="input" type="text" />
        <button type="submit" disabled={submitting}>create</button>
      </form>
    </div>
  </div>
)

export default reduxForm({ form: 'card'})(CardForm)