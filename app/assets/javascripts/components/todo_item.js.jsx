var TodoItem = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    done: React.PropTypes.bool,
    nextId: React.PropTypes.number
  },

  render: function() {
    return (
      <li>
        <div>
          <div>Title: {this.props.title}</div>
          <div>Done: {this.props.done}</div>
          <div>Next: {this.props.nextId}</div>
        </div>
      </li>
    );
  }
});
