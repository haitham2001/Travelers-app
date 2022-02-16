import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travellers/styles/colors.dart';

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    );

// Widget articleBuilder(list, context) =>
//     ConditionalBuilder(
//       condition: list.length > 0,
//       builder: (context) =>
//           ListView.separated(
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) =>
//                 buildArticleItem(list[index], context),
//             separatorBuilder: (context, index) => myDivider(),
//             itemCount: 10,),
//       fallback: (context) => Center(child: CircularProgressIndicator()),
//     );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

// Widget defaultTextField({
//   required String labeltxt,
//   required Icon prefixicon,
//   bool isPass = false,
//   IconData? suffix,
//   TextEditingController? controller,
//   required TextInputType txtinput,
//   Function()? SuffixPressed,
//   VoidCallback? ontap,
// }) {
//   return TextFormField(
//     keyboardType: txtinput,
//     controller: controller,
//     onTap: ontap,
//     obscureText: isPass,
//     decoration: InputDecoration(
//       labelText: labeltxt,
//       border: OutlineInputBorder(),
//       prefixIcon: prefixicon,
//       suffixIcon: IconButton(
//         icon: Icon(suffix),
//         onPressed: SuffixPressed,
//       ),
//     ),
//     validator: (value) {
//       if (value!.isEmpty) return 'Field Must not be empty';
//
//       return null;
//     },
//   );
// }

Widget defaultBtn({
  double left_margin_icon=10,
  double right_margin_icon=10,
  double right_margin_text=20,
  double width = 330,
  Color backgroundcolor = defaultColor,
  bool isUpperCase = true,
  double BorderRadValue = 31,
  required String txt,
  required VoidCallback function,
  IconData? icon,
  double fontSize = 20,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(BorderRadValue),
      color: backgroundcolor,
    ),
    child: TextButton.icon(
      icon: Container(
        margin: EdgeInsets.only(right: right_margin_icon,left: left_margin_icon),
        child: Icon(
          icon,
          color: Colors.white,
          size: 38,
        ),
      ),
      onPressed: function,
      label: Container(
        margin: EdgeInsets.only(right: right_margin_text,left: left_margin_icon),
        child: Text(
          isUpperCase ? txt.toUpperCase() : txt,
          style:  TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
      ),
    ),
  );
}

// Widget buildArticleItem(article, context) => Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         children: [
//           Container(
//             width: 170.0,
//             height: 170.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadiusDirectional.circular(10.0),
//               image: DecorationImage(
//                   image: NetworkImage('${article['urlToImage']}'),
//                   fit: BoxFit.cover),
//             ),
//           ),
//           SizedBox(
//             width: 15.0,
//           ),
//           Expanded(
//             child: Container(
//               height: 170.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       '${article['title']}',
//                       style: Theme.of(context).textTheme.bodyText1,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Text(
//                     '${article['publishedAt']}',
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
