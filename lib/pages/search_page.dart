// import 'package:flutter/material.dart';
// import 'package:hello_world/models/moment.dart';
// import 'package:hello_world/resources/dimentions.dart';
// import 'package:hello_world/widgets/book_cover.dart';
// import 'package:hello_world/widgets/search_and_filter.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key, required this.moments});

//   final List<Moment> moments;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SearchAndFilter(
//               onSubmit: (query) {} ,
//             ),
//           ),
//               const SizedBox(
//             height: largeSize,
//           ),
//            Expanded(
//              child: GridView.builder(
//                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//                 primary: false,
//                   itemBuilder: (context, index) => PostCover(imageUrl:moments[index].imageUrl),
//                   itemCount: moments.length,
//               ),
//                  ),
//         ]),
//     );
//   }
// }