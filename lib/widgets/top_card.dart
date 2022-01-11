import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  final int totalAmount;
  const TopCard({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 21),
      width: double.infinity,
      height: 204,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: const Color(0xffBAB8B8)),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: const Color(0xffBAB8B8).withOpacity(0.5),
                blurRadius: 6,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 67,
          ),
          Text(
            '$totalAmount\$',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff707070)),
          ),
        ],
      ),
    );
  }
}
