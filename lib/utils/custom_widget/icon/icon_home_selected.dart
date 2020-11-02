import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconHomeSelected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 25,
      child: SvgPicture.string(
        _svg_up4mto,
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}

const String _svg_up4mto =
    '<svg viewBox="0.0 0.0 24.7 21.0" ><defs><linearGradient id="gradient" x1="0.65137" y1="0.634761" x2="0.148526" y2="0.0"><stop offset="0.0" stop-color="#ff233329"  /><stop offset="1.0" stop-color="#ff63d471"  /></linearGradient></defs><path transform="translate(-3.0, -4.5)" d="M 12.8656177520752 25.46444320678711 L 12.8656177520752 18.06523132324219 L 17.79843139648438 18.06523132324219 L 17.79843139648438 25.46444320678711 L 23.96444320678711 25.46444320678711 L 23.96444320678711 15.59882354736328 L 27.66405296325684 15.59882354736328 L 15.33202266693115 4.5 L 3.000000238418579 15.59882354736328 L 6.699607849121094 15.59882354736328 L 6.699607849121094 25.46444320678711 L 12.8656177520752 25.46444320678711 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
