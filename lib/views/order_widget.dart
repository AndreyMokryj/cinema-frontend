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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Заказ ${widget.order.placeIds
          .length} билета(ов) на сумму ${widget.order.sum} грн.'),
        Row(
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.zero,
              child: Text('Отменить'),
            ),
          ],
        ),
      ],
    );
  }

}