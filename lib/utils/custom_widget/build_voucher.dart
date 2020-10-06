import 'package:flutter/material.dart';

class BuildVoucher extends StatelessWidget {
  const BuildVoucher({
    Key key,
    @required this.voucherTitle,
    @required this.brandTitle,
    @required this.price,
  }) : super(key: key);

  final String brandTitle;
  final String voucherTitle;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(
        left: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            // child: Image.asset(
            //   'assets/images/Untitled-1.png',
            //   fit: BoxFit.fill,
            // ),
            child: Container(
              height: 100,
              color: Colors.teal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.voucherTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(this.brandTitle),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text('B'),
                  backgroundColor: Colors.teal,
                  radius: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(this.price.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
