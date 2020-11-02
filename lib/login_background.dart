import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class login_background extends StatelessWidget {
  login_background({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 375.6, 307.9),
          size: Size(375.6, 307.9),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: SvgPicture.string(
            _svg_31lsmg,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

const String _svg_31lsmg =
    '<svg viewBox="0.0 0.0 375.6 307.9" ><path transform="translate(-6223.0, 306.32)" d="M 6223 -200.5945739746094 C 6223 -200.5945739746094 6267.67529296875 -84.00350189208984 6373.40380859375 -100.6593704223633 C 6479.13232421875 -117.3152389526367 6530.54833984375 -49.96760177612305 6539.96240234375 -22.4492130279541 C 6549.37646484375 5.069177150726318 6598.6201171875 1.448336243629456 6598.6201171875 1.448336243629456 L 6598.6201171875 -306.3231201171875 L 6223 -306.3231201171875 L 6223 -200.5945739746094 Z" fill="#4fba6f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
