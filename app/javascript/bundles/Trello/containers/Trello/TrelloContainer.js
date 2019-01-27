import { connect } from 'react-redux';
import TrelloBoard from '../../components/TrelloBoard/TrelloBoard';
import * as actions from '../../actions/lists/listActions';

const mapStateToProps = (state) => ({ lists: state.lists });

export default connect(mapStateToProps, actions)(TrelloBoard);
