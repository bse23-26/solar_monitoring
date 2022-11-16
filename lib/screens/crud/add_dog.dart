import 'package:flutter/material.dart';
import 'dog.dart';

class AddDog extends StatefulWidget {
  const AddDog({Key? key}) : super(key: key);

  @override
  State<AddDog> createState() => _AddDogState();
}

class _AddDogState extends State<AddDog> {
  final _dogNameController = TextEditingController();
  final _dogIdController = TextEditingController();
  final _dogAgeController = TextEditingController();

  bool _validateName = false;
  bool _validateId = false;
  bool _validateAge = false;

  final _dogService=DogService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite CRUD"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Dog',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _dogNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText:
                    _validateName ? 'Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _dogIdController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Id',
                    labelText: 'Id',
                    errorText: _validateId
                        ? 'Contact Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _dogAgeController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Age',
                    labelText: 'Age',
                    errorText: _validateAge
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _dogNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _dogIdController.text.isEmpty
                              ? _validateId = true
                              : _validateId = false;
                          _dogAgeController.text.isEmpty
                              ? _validateAge = true
                              : _validateAge = false;

                        });
                        if (_validateName == false &&
                            _validateId == false &&
                            _validateAge == false) {

                          // print("Good Data Can Save");
                          var dog = Dog(int.parse(_dogIdController.text), _dogNameController.text, int.parse(_dogAgeController.text));
                          var result = await _dogService.save(dog);
                          Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _dogNameController.text = '';
                        _dogIdController.text = '';
                        _dogAgeController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}