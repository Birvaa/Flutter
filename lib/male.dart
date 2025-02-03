import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/addDetails.dart';
import 'package:flutter_application_1/malelist.dart';

class Male extends StatefulWidget {
  @override
  _MaleState createState() => _MaleState();
}

class _MaleState extends State<Male> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController castController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  List<MaleList> maleList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Male Form'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/Male_bg.jpg'), // Ensure this path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 6, 57, 99),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: imageUrlController,
                      decoration: InputDecoration(
                          labelText: 'Image URL',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 6, 57, 99),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: castController,
                      decoration: InputDecoration(
                          labelText: 'Cast',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 6, 57, 99),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: educationController,
                      decoration: InputDecoration(
                          labelText: 'Education',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 6, 57, 99),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: birthdateController,
                      decoration: InputDecoration(
                          labelText: 'Birthdate',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 6, 57, 99),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: const Color.fromARGB(255, 6, 57,
                                      99), // header background color
                                  onPrimary: Colors.white, // header text color
                                  onSurface: const Color.fromARGB(
                                      255, 6, 57, 99), // body text color
                                ),
                                dialogBackgroundColor: Colors.white,
                              ),
                              child: child!,
                            );
                          },
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          // Handle the picked date
                        }
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 6, 57, 99),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: occupationController,
                      decoration: InputDecoration(
                          labelText: 'Occupation',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 6, 57, 99),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      String imageUrl = imageUrlController.text;
                      String cast = castController.text;
                      String birthdate = birthdateController.text;
                      String education = educationController.text;
                      String occupation = occupationController.text;
                      String city = cityController.text;
                      if (name.isNotEmpty && city.isNotEmpty) {
                        // Add the data to the list
                        setState(() {
                          maleList.add(MaleList(
                            name: name,
                            imageUrl: imageUrl,
                            cast: cast,
                            birthdate: birthdate,
                            education: education,
                            occupation: occupation,
                            city: city,
                          ));
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddDetails(
                                      detailsList: {},
                                    )));
                      }
                    },
                    child: Text('Submit',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 6, 57, 99),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
