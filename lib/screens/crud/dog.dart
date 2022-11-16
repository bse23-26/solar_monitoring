import '../../database/database.dart';

class Dog {
  final int id;
  final String name;
  final int age;

  const Dog(this.id, this.name, this.age);

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'age': age,
  };

  @override
  String toString() => 'Dog{id: $id, name: $name, age: $age}';
}


class DogService {
  late DB _db;

  DogService() {
    _db = DB();
  }

  save(Dog dog) async => await _db.insertData('dogs', dog.toMap());

  readAll() async => await _db.readData('dogs');

  update(Dog dog) async => await _db.updateData('dogs', dog.toMap());

  delete(dogId) async => await _db.deleteDataById('dogs', dogId);
}