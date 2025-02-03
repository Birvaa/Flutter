import 'package:flutter/material.dart';
import 'addDetails.dart';
import 'favScreen.dart';

class Profile extends StatefulWidget {
  final Map<String, Map<String, String>> detailsList;

  Profile({required this.detailsList});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Map<String, Map<String, String>> detailsList;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Map<String, String>> favList = [];

  @override
  void initState() {
    super.initState();
    detailsList = widget.detailsList;

    // Add 3 default users
    detailsList.addAll({
      'John Doe': {
        'name': 'John Doe',
        'birthdate': '1990-01-01',
        'state': 'California',
        'city': 'Los Angeles',
        'qualification': 'B.Sc',
        'college': 'UCLA',
        'income': '50000',
        'profession': 'Engineer',
        'livingWithParents': 'No',
        'gender': 'Male',
        'caste': 'General',
        'workType': 'Private Firm',
        'hobbies': 'Reading, Traveling',
      },
      'Jane Smith': {
        'name': 'Jane Smith',
        'birthdate': '1992-02-02',
        'state': 'New York',
        'city': 'New York City',
        'qualification': 'M.Sc',
        'college': 'NYU',
        'income': '60000',
        'profession': 'Doctor',
        'livingWithParents': 'No',
        'gender': 'Female',
        'caste': 'OBC',
        'workType': 'Government',
        'hobbies': 'Cooking, Music',
      },
      'Alice Johnson': {
        'name': 'Alice Johnson',
        'birthdate': '1994-03-03',
        'state': 'Texas',
        'city': 'Houston',
        'qualification': 'Ph.D',
        'college': 'Rice University',
        'income': '70000',
        'profession': 'Professor',
        'livingWithParents': 'No',
        'gender': 'Female',
        'caste': 'SC',
        'workType': 'Private Firm',
        'hobbies': 'Sports, Music',
      },
    });
  }

  void _nextPage() {
    setState(() {
      _currentPage = (_currentPage + 1) % detailsList.length;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _previousPage() {
    setState(() {
      _currentPage =
          (_currentPage - 1 + detailsList.length) % detailsList.length;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _deleteCurrentCard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this card?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  detailsList.remove(detailsList.keys.elementAt(_currentPage));
                  if (_currentPage >= detailsList.length) {
                    _currentPage = detailsList.length - 1;
                  }
                  _pageController.jumpToPage(_currentPage);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editCurrentCard() {
    final key = detailsList.keys.elementAt(_currentPage);
    final detail = detailsList[key]!;

    final TextEditingController nameController =
        TextEditingController(text: detail['name']);
    final TextEditingController birthdateController =
        TextEditingController(text: detail['birthdate']);
    final TextEditingController stateController =
        TextEditingController(text: detail['state']);
    final TextEditingController cityController =
        TextEditingController(text: detail['city']);
    final TextEditingController qualificationController =
        TextEditingController(text: detail['qualification']);
    final TextEditingController collegeController =
        TextEditingController(text: detail['college']);
    final TextEditingController incomeController =
        TextEditingController(text: detail['income']);
    final TextEditingController professionController =
        TextEditingController(text: detail['profession']);
    final TextEditingController livingWithParentsController =
        TextEditingController(text: detail['livingWithParents']);
    final TextEditingController genderController =
        TextEditingController(text: detail['gender']);
    final TextEditingController casteController =
        TextEditingController(text: detail['caste']);
    final TextEditingController workTypeController =
        TextEditingController(text: detail['workType']);
    final TextEditingController hobbiesController =
        TextEditingController(text: detail['hobbies']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Details'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name')),
                TextField(
                    controller: birthdateController,
                    decoration: InputDecoration(labelText: 'Birthdate')),
                TextField(
                    controller: stateController,
                    decoration: InputDecoration(labelText: 'State')),
                TextField(
                    controller: cityController,
                    decoration: InputDecoration(labelText: 'City')),
                TextField(
                    controller: qualificationController,
                    decoration: InputDecoration(labelText: 'Qualification')),
                TextField(
                    controller: collegeController,
                    decoration: InputDecoration(labelText: 'College')),
                TextField(
                    controller: incomeController,
                    decoration: InputDecoration(labelText: 'Income')),
                TextField(
                    controller: professionController,
                    decoration: InputDecoration(labelText: 'Profession')),
                TextField(
                    controller: livingWithParentsController,
                    decoration:
                        InputDecoration(labelText: 'Living with Parents')),
                TextField(
                    controller: genderController,
                    decoration: InputDecoration(labelText: 'Gender')),
                TextField(
                    controller: casteController,
                    decoration: InputDecoration(labelText: 'Caste')),
                TextField(
                    controller: workTypeController,
                    decoration: InputDecoration(labelText: 'Work Type')),
                TextField(
                    controller: hobbiesController,
                    decoration: InputDecoration(labelText: 'Hobbies')),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  detailsList[key] = {
                    'name': nameController.text,
                    'birthdate': birthdateController.text,
                    'state': stateController.text,
                    'city': cityController.text,
                    'qualification': qualificationController.text,
                    'college': collegeController.text,
                    'income': incomeController.text,
                    'profession': professionController.text,
                    'livingWithParents': livingWithParentsController.text,
                    'gender': genderController.text,
                    'caste': casteController.text,
                    'workType': workTypeController.text,
                    'hobbies': hobbiesController.text,
                  };
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleFavorite() {
    final detail = detailsList.values.elementAt(_currentPage);
    setState(() {
      if (favList.contains(detail)) {
        favList.remove(detail);
      } else {
        favList.add(detail);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: detailsList.length,
            itemBuilder: (context, index) {
              final key = detailsList.keys.elementAt(index);
              final detail = detailsList[key]!;
              return Container(
                height: 600,
                width: 350,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/gender_bg.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Name: ${detail['name'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Birthdate: ${detail['birthdate'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'State: ${detail['state'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'City: ${detail['city'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Qualification: ${detail['qualification'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'College: ${detail['college'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Income: ${detail['income'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Profession: ${detail['profession'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Living with Parents: ${detail['livingWithParents'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Gender: ${detail['gender'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Caste: ${detail['caste'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Work Type: ${detail['workType'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Hobbies: ${detail['hobbies'] ?? ''}',
                              style: TextStyle(
                                fontSize: 23,
                                color: const Color.fromARGB(255, 70, 2, 2),
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: _editCurrentCard,
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: _deleteCurrentCard,
                                ),
                                IconButton(
                                  icon: Icon(
                                    favList.contains(detail)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: favList.contains(detail)
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: _toggleFavorite,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 50),
                  onPressed: _previousPage,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, size: 50),
                  onPressed: _nextPage,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 255, 235, 235),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 70, 2, 2),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: const Color.fromARGB(255, 70, 2, 2),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: const Color.fromARGB(255, 70, 2, 2),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: const Color.fromARGB(255, 70, 2, 2),
            ),
            label: 'About us',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDetails(detailsList: detailsList),
              ),
            ).then((updatedDetailsList) {
              if (updatedDetailsList != null) {
                setState(() {
                  detailsList = updatedDetailsList;
                });
              }
            });
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavScreen(favList: favList),
              ),
            );
          }
        },
      ),
    );
  }
}
