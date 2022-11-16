import 'screens/bluetooth/BluetoothMainPage.dart';
import 'screens/home.dart';
import 'screens/crud/add_dog.dart';

var routes = {
  '/': (context) => const Home(),
  '/bluetooth': (context) => const BluetoothMainPage(),
  '/dog': (context) => const AddDog()
};
