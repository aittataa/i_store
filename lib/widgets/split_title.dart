import 'package:flutter/material.dart';
import 'package:i_store/screens/products_screen.dart';

class SplitTitle extends StatelessWidget {
  final String title;
  const SplitTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Container(
        width: 10,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w900,
          fontSize: 18,
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsScreen(title: title),
            ),
          );
        },
        //onTap: () => Get.to(ProductsScreen(title: title)),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
