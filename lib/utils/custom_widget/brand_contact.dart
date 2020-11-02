import 'package:flutter/material.dart';
import '../constant.dart';

class BrandContact extends StatelessWidget {
  const BrandContact({
    this.email,
    this.phone,
    this.numOfStore: 0,
    this.type,
  });

  final String email;
  final String phone;
  final int numOfStore;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Divider(
            color: Colors.black,
            height: 0,
          ),
          email != null
              ? ListTile(
                  title: Text(
                    email,
                    style: SMALL_TEXT_STYLE,
                  ),
                  leading: Icon(Icons.email),
                )
              : Container(),
          Divider(
            color: Colors.black,
            height: 0,
          ),
          phone != null
              ? ListTile(
                  title: Text(
                    phone,
                    style: SMALL_TEXT_STYLE,
                  ),
                  leading: Icon(Icons.phone),
                  trailing: Icon(Icons.arrow_forward_ios),
                )
              : Container(),
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
          type != null
              ? ListTile(
                  title: Text(
                    type,
                    style: SMALL_TEXT_STYLE,
                  ),
                  leading: Icon(Icons.label),
                )
              : Container(),
        ],
      ),
    );
  }
}
