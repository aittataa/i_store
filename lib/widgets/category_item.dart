// import 'package:flutter/material.dart';
//
// class CategoryItem extends StatelessWidget {
//   final bool state;
//   final String category;
//   final Function onTap;
//   const CategoryItem({this.category, this.state, this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 500),
//         curve: Curves.linearToEaseOut,
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(horizontal: 10),
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: state ? Colors.black54 : Colors.transparent,
//               width: 2,
//             ),
//           ),
//         ),
//         child: Text(
//           "$category",
//           style: TextStyle(
//             color: state ? Colors.black54 : Colors.black26,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//       ),
//     );
//   }
// }
