import 'package:flutter/material.dart';
import 'package:solar_monitoring/widgets/service_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // foregroundColor: Colors.white,
            title: const Center(child: Text('Solar Monitoring'),
        )),
        body: Column(
          children: [
            Row(children: const [
              ServiceCard(route: '/bluetooth', text: 'bluetooth', icon: Icons.bluetooth),
              ServiceCard(route: '/dog', text: 'dog', icon: Icons.bluetooth_audio)
            ],)
          ],
        )
    );
  }
}


//InkWell(
//                 child: Container(
//                   padding: const EdgeInsets.all(20.0),
//                   margin: const EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                       boxShadow: const [
//                         BoxShadow(
//                           offset: Offset(
//                             1.0,
//                             5.0,
//                           ),
//                           blurRadius: 10.0,
//                           spreadRadius: 1.0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.grey),
//                       color: Colors.white
//                   ),
//                   child: Column(
//                     children: const [
//                       Icon(Icons.bluetooth),
//                       Text('bluetooth')
//                     ],
//                   ),
//                 ),
//                 onTap: ()=>Navigator.pushNamed(context, '/bluetooth'),
//               ),
