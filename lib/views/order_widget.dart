import 'package:flutter/material.dart';
import 'package:flutterappweb/model/order_model.dart';

class OrderWidget extends StatefulWidget{
  final Order order;

  const OrderWidget({Key key, this.order}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderWidgetState();
  }

}

class _OrderWidgetState extends State<OrderWidget> {
  Order order;

  @override
  void initState() {
    order = widget.order;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text('Заказ #${order.id} - ${order.placeIds
            .length} билета(ов) на сумму ${order.sum} грн.'),
        ),
        Column(
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.zero,
              child: Text('Оплатить'),
              onPressed: _payOrder,
            ),

            FlatButton(
              padding: EdgeInsets.zero,
              child: Text('Отменить'),
              onPressed: _cancelOrder,
            ),
          ],
        ),
      ],
    );
  }


  void _payOrder() {

  }

  void _cancelOrder() {

  }
}

enum OrderStatus{PAID, UNPAID, CANCELLED}