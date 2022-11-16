import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const ServiceCard({Key? key, required this.route, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(
                  1.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
            color: Colors.white
        ),
        child: Column(
          children: [
            Icon(icon),
            Text(text)
          ],
        ),
      ),
      onTap: ()=>Navigator.pushNamed(context, route),
    );
  }
}
