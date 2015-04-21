var TodoList = React.createClass({
  propTypes: {
    items: React.PropTypes.array,
    itemHead: React.PropTypes.number
  },

  render: function() {
    var todoItems = this.props.items.map(function (item) {
      return (
        <TodoItem
          title={item.title}
          done={item.done}
          nextId={item.next_id}
        />
      )
    })

    return (
      <ul class="todo-list">{todoItems}</ul>
    );
  }
});
