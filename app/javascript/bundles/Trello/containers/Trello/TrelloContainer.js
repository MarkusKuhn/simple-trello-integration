import { connect } from 'react-redux';
import TrelloBoard from '../../components/TrelloBoard/TrelloBoard';
import { fetchLists } from '../../actions/lists/listActions';
import { postCreateCard } from '../../actions/cards/cardActions';

const mapStateToProps = (state) => {
  return { lists: state.lists.lists || [], submitting: state.cards && state.cards.submitting }};

export default connect(mapStateToProps, { fetchLists, postCreateCard })(TrelloBoard);
