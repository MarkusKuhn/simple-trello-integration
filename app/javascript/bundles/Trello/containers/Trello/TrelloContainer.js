import { connect } from 'react-redux';
import TrelloBoard from '../../components/TrelloBoard/TrelloBoard';
import { fetchLists } from '../../actions/lists/listActions';

const mapStateToProps = (state) => {
  return { lists: state.lists.lists || [] }};

export default connect(mapStateToProps, { fetchLists })(TrelloBoard);
