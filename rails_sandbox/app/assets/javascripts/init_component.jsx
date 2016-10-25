$(function() {
  items = [
    {name: '水', price: 300},
    {name: '土', price: 400}
  ];

  ReactDOM.render(
      <ItemList items={items} />, // これを
      document.getElementById('items') // ここにレンダリングしろ
  );
});
