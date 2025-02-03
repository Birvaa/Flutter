import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddDetails extends StatefulWidget {
  final Map<String, Map<String, String>> detailsList;

  AddDetails({required this.detailsList});

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _workInController = TextEditingController();

  String _selectedGender = 'Male';
  String _selectedCaste = 'General';
  String _selectedWorkType = 'Engineer';
  String _selectedWorkIn = 'Private';
  bool _livingWithParents = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _birthdateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitDetails() {
    if (_formKey.currentState!.validate()) {
      widget.detailsList[_nameController.text] = {
        'name': _nameController.text,
        'birthdate': _birthdateController.text,
        'state': _stateController.text,
        'city': _cityController.text,
        'qualification': _qualificationController.text,
        'college': _collegeController.text,
        'income': _incomeController.text,
        'profession': _professionController.text,
        'livingWithParents': _livingWithParents ? 'Yes' : 'No',
        'gender': _selectedGender,
        'caste': _selectedCaste,
        'workType': _selectedWorkType,
        'workIn': _selectedWorkType == 'Housewife' ? '' : _selectedWorkIn,
      };
      Navigator.of(context).pop(widget.detailsList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Details'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/gender_bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          // Form and Stepper
          Form(
            key: _formKey,
            child: Stepper(
              currentStep: _currentStep,
              onStepTapped: (int step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                if (_currentStep < 3) {
                  setState(() {
                    _currentStep += 1;
                  });
                } else {
                  _submitDetails();
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) {
                  setState(() {
                    _currentStep -= 1;
                  });
                }
              },
              steps: [
                Step(
                  title: Text('Personal Details'),
                  content: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        items: ['Male', 'Female', 'Other'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _birthdateController,
                        decoration: InputDecoration(
                          labelText: 'Birthdate',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onTap: () => _selectDate(context),
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your birthdate';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectedCaste,
                        decoration: InputDecoration(
                          labelText: 'Caste',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        items:
                            ['General', 'OBC', 'SC', 'ST'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCaste = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your caste';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                ),
                Step(
                  title: Text('Educational Details'),
                  content: Column(
                    children: [
                      TextFormField(
                        controller: _qualificationController,
                        decoration: InputDecoration(
                          labelText: 'Qualification',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your qualification';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _collegeController,
                        decoration: InputDecoration(
                          labelText: 'College',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your college';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 1,
                ),
                Step(
                  title: Text('Work Details'),
                  content: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedWorkType,
                        decoration: InputDecoration(
                          labelText: 'Work Type',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        items: ['Engineer', 'Doctor', 'Teacher', 'Housewife']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedWorkType = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your work type';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      if (_selectedWorkType != 'Housewife')
                        DropdownButtonFormField<String>(
                          value: _selectedWorkIn,
                          decoration: InputDecoration(
                            labelText: 'Work In',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 75, 1, 1),
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          items: ['Private', 'Government'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedWorkIn = newValue!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select where you work';
                            }
                            return null;
                          },
                        ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _incomeController,
                        decoration: InputDecoration(
                          labelText: 'Income',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your income';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 2,
                ),
                Step(
                  title: Text('Address Details'),
                  content: Column(
                    children: [
                      TextFormField(
                        controller: _stateController,
                        decoration: InputDecoration(
                          labelText: 'State',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your state';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 75, 1, 1),
                            fontSize: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: _livingWithParents,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _livingWithParents = newValue!;
                              });
                            },
                          ),
                          Text(
                            'Living with Parents',
                            style: TextStyle(
                              color: Color.fromARGB(255, 75, 1, 1),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
