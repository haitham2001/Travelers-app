import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget buildArticleItem(article, context) =>
    Padding(
      padding: const EdgeInsets.all(20.0),

      child: Row(
        children:
        [
          Container(

            width: 170.0,

            height: 170.0,

            decoration: BoxDecoration(

              borderRadius: BorderRadiusDirectional.circular(10.0),

              image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),

                  fit: BoxFit.cover),

            ),

          ),

          SizedBox(width: 15.0,),

          Expanded(
            child: Container(
              height: 170.0,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children:
                [
                  Expanded(

                    child: Text(

                      '${article['title']}',

                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text(

                    '${article['publishedAt']}',

                    style: TextStyle(

                      color: Colors.grey,

                    ),

                  ),

                ],

              ),

            ),

          ),


        ],

      ),

    );

Widget myDivider() =>
    Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    );

Widget articleBuilder(list, context) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) =>
          ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 10,),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );


void navigateTo(context, widget) =>
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));

void NavigateAndFinish(context, widget) =>

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=>widget),
            (route) => false
    );

Widget defaultTextField ({
  required String labeltxt,
  required Icon prefixicon,
  bool isPass = false,
  IconData? suffix,
  TextEditingController? controller,
  required TextInputType txtinput,
  Function()? SuffixPressed,
  VoidCallback? ontap,
})
{
  return TextFormField(
    keyboardType: txtinput,
    controller: controller,
    onTap: ontap,
    obscureText: isPass,
    decoration: InputDecoration(
      labelText: labeltxt,
      border: OutlineInputBorder(),
      prefixIcon: prefixicon,
      suffixIcon: IconButton(
        icon: Icon(suffix),
        onPressed: SuffixPressed,
      ),
    ),
    validator: (value)
    {
      if (value!.isEmpty)
        return 'Field Must not be empty';

      return null;
    },

  );


}



Widget defaultBtn ({
  double width = double.infinity,
  Color backgroundcolor = Colors.blue,
  bool isUpperCase = true,
  required String txt,
  required VoidCallback function ,
})
{
  return Container(
    width: width,
    color: backgroundcolor,
    child: MaterialButton(onPressed: function,

      child: Text(
        isUpperCase ? txt.toUpperCase() : txt,
        style: TextStyle(
          fontSize:15.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}