import 'package:flutter/material.dart';
import '../constant.dart';

class BrandContact extends StatelessWidget {
  const BrandContact({
    Key key,
    this.email,
    this.phone,
    this.numOfStore: 0,
  }) : super(key: key);

  final String email;
  final String phone;
  final int numOfStore;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Divider(
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            title: Text(
              email,
              style: SMALL_TEXT_STYLE,
            ),
            leading: Icon(Icons.email),
          ),
          Divider(
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            title: Text(
              phone,
              style: SMALL_TEXT_STYLE,
            ),
            leading: Icon(Icons.phone),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            title: Text(
              '$numOfStore cửa hàng áp dụng',
              style: SMALL_TEXT_STYLE,
            ),
            leading: Icon(Icons.store),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(
            color: Colors.black,
            height: 0,
          ),
        ],
      ),
    );
  }
}
