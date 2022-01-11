import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String date;
  final int amount;
  final Function() onPress;
  const ListItem(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.date,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 13, bottom: 8),
        padding:
            const EdgeInsets.only(top: 26, right: 18, bottom: 15, left: 26),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffBAB8B8)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xffBAB8B8).withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '$amount\$',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff707070)),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              date,
              style:
                  TextStyle(color: const Color(0xff707070).withOpacity(0.43)),
            )
          ],
        ),
      ),
    );
  }
}
