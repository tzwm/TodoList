var TodoList = React.createClass({
  propTypes: {
    items: React.PropTypes.array,
    itemHead: React.PropTypes.number
  },

  handleNewTodoKeyDown: function(event) {
    var ENTER_KEY = 13;

    if (event.which !== ENTER_KEY) {
      return;
    }

    event.preventDefault();

    var val = this.refs.newField.getDOMNode().value.trim();

    if (val) {
      $.ajax({
        url: "/",
        method: "post",
        data: {title: val},
        success: function (result) {
          if (result.status === "success") {
          }
        }
      });
    }
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
      <div>
        <input
          ref="newField"
          id="new-todo-item"
          placeholder="To Do List"
          onKeyDown={this.handleNewTodoKeyDown}
          autoFocus={true}
        />

        <ul class="todo-list">{todoItems}</ul>
    </div>
    );
  }
});
