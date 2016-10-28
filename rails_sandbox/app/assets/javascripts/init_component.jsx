$(function() {
  var items = [
    {name: '水', price: 300},
    {name: '土', price: 400}
  ];

  var elem = document.getElementById('items');

  if (elem) {
    ReactDOM.render(<ItemList items={items} />, elem);
  }
});
