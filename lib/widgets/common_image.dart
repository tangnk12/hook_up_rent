// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_networkimage/provider.dart';

// final networkUriReg = RegExp('^http');

// final localUriReg = RegExp('^static');

// class CommonImage extends StatelessWidget {
//   late final String src;
//   late final double width;
//   late final double height;
//   late final BoxFit fit;

//   CommonImage(String imag, {required double width});

//   @override
//   Widget build(BuildContext context) {
//     if (networkUriReg.hasMatch(src)) {
//       return Image(
//           width: width,
//           height: 80,
//           fit: fit,
//           image: AdvancedNetworkImage(
//             src,
//             useDiskCache: true,
//             cacheRule: CacheRule(maxAge: Duration(days: 7)),
//             timeoutDuration: Duration(seconds: 20),
//           ));
//     }
//     if (localUriReg.hasMatch(src)) {
//       return Image.asset(
//         src,
//         width: width,
//         height: height,
//         fit: fit,
//       );
//     }
//     assert(false, 'picture problem system');
//     return Container();
//   }
// }
