const ItemList = props => {
    return <ul className="item-list">
        {props.items.map(item => <ItemDetail item={item} />)}
    </ul>;
};
const ItemDetail = props => {
    const item = props.item;
    return <li className={'item' + item.stock === 0 ? ' soldout' : ''}>
        <div className="item-name">{item.name}</div>
        <div className="item-price">{item.price}</div>
    </li>;
};
