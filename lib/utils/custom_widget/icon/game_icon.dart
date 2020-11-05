import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      child: SvgPicture.string(
        _svg_edxtbt,
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}

const String _svg_edxtbt =
    '<svg viewBox="0.0 9.1 28.8 19.1" ><defs><radialGradient id="gradient" gradientTransform="matrix(1.0 0.0 0.0 1.0 0.0 0.0)" fx="0.499999" fy="0.5" fr="0.0" cx="0.499999" cy="0.5" r="0.556351"><stop offset="0.0" stop-color="#aff1da" /><stop offset="1.0" stop-color="#5d4257" /></radialGradient></defs><path transform="translate(0.0, 0.0)" d="M 26.21148872375488 12.42417144775391 C 22.40944862365723 6.177618026733398 16.68196487426758 10.52341938018799 16.68196487426758 10.52341938018799 C 16.31051063537598 10.80415630340576 15.62557220458984 11.03497409820557 15.16018104553223 11.03604793548584 L 13.62605381011963 11.0371208190918 C 13.16066074371338 11.03765869140625 12.47572612762451 10.80684089660645 12.10480880737305 10.52610397338867 C 12.10480880737305 10.52610397338867 6.376789093017578 6.17922830581665 2.57421350479126 12.42578125 C -1.227290034294128 18.67018699645996 0.3046907782554626 25.47070121765137 0.3046907782554626 25.47070121765137 C 0.5730827450752258 27.13580513000488 1.457702398300171 28.2469482421875 3.127099752426147 28.10738182067871 C 4.791666507720947 27.96835517883301 8.404756546020508 23.62308883666992 8.404756546020508 23.62308883666992 C 8.703208923339844 23.26505470275879 9.32856273651123 22.97250556945801 9.792880058288574 22.97250556945801 L 18.99013328552246 22.97089767456055 C 19.45499038696289 22.97089767456055 20.07980346679688 23.26344299316406 20.37771797180176 23.62147903442383 C 20.37771797180176 23.62147903442383 23.99134635925293 27.96674537658691 25.65859794616699 28.10577201843262 C 27.32584953308105 28.24533653259277 28.21261596679688 27.13311958312988 28.47939682006836 25.46909141540527 C 28.47886085510254 25.46909141540527 30.01352500915527 18.66965103149414 26.21148872375488 12.42417144775391 Z M 10.93622970581055 17.50858688354492 L 8.96408748626709 17.50858688354492 L 8.96408748626709 19.40933799743652 C 8.96408748626709 19.40933799743652 8.546468734741211 19.72818756103516 7.900181293487549 19.72013664245605 C 7.25496768951416 19.71047401428223 6.962956428527832 19.37230110168457 6.962956428527832 19.37230110168457 L 6.962956428527832 17.50912284851074 L 5.100317001342773 17.50912284851074 C 5.100317001342773 17.50912284851074 4.867889881134033 17.27079010009766 4.805622577667236 16.64329147338867 C 4.744429588317871 16.01578903198242 5.062742233276367 15.50852966308594 5.062742233276367 15.50852966308594 L 7.035422801971436 15.50852966308594 L 7.035422801971436 13.53638553619385 C 7.035422801971436 13.53638553619385 7.441231250762939 13.31898880004883 8.024714469909668 13.3356294631958 C 8.608736038208008 13.35387897491455 9.036552429199219 13.57342433929443 9.036552429199219 13.57342433929443 L 9.028500556945801 15.50799369812012 L 10.89114093780518 15.50799369812012 C 10.89114093780518 15.50799369812012 11.21643161773682 15.92561149597168 11.24326992034912 16.4301872253418 C 11.27011013031006 16.93530082702637 10.93622970581055 17.50858688354492 10.93622970581055 17.50858688354492 Z M 19.98211288452148 19.67504501342773 C 19.1184253692627 19.67504501342773 18.42221832275391 18.9766902923584 18.42221832275391 18.11407852172852 C 18.42221832275391 17.24985694885254 19.11842727661133 16.5531120300293 19.98211288452148 16.5531120300293 C 20.84203910827637 16.5531120300293 21.54361534118652 17.24985694885254 21.54361534118652 18.11407852172852 C 21.54361343383789 18.97722816467285 20.84203720092773 19.67504501342773 19.98211288452148 19.67504501342773 Z M 19.98211288452148 15.38023948669434 C 19.1184253692627 15.38023948669434 18.42221832275391 14.6824197769165 18.42221832275391 13.81980800628662 C 18.42221832275391 12.95558643341064 19.11842727661133 12.2588415145874 19.98211288452148 12.2588415145874 C 20.84203910827637 12.2588415145874 21.54361534118652 12.95558643341064 21.54361534118652 13.81980800628662 C 21.54361343383789 14.68295669555664 20.84203720092773 15.38023948669434 19.98211288452148 15.38023948669434 Z M 23.86949920654297 17.68572616577148 C 23.00581169128418 17.68572616577148 22.30960464477539 16.98790550231934 22.30960464477539 16.12475776672363 C 22.30960464477539 15.26107406616211 23.00581359863281 14.5637903213501 23.86949920654297 14.5637903213501 C 24.72942733764648 14.5637903213501 25.43100166320801 15.26107311248779 25.43100166320801 16.12475776672363 C 25.43100166320801 16.98790550231934 24.72942733764648 17.68572616577148 23.86949920654297 17.68572616577148 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';