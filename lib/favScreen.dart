import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  final List<Map<String, String>> favList;

  FavScreen({required this.favList});

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late List<Map<String, String>> favList;

  @override
  void initState() {
    super.initState();
    favList = widget.favList;
  }

  void _unfavCard(Map<String, String> detail) {
    setState(() {
      favList.remove(detail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favList.length,
        itemBuilder: (context, index) {
          final detail = favList[index];
          return Container(
            height: 650,
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
                    child: SingleChildScrollView(
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
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: Icon(Icons.favorite,
                                  color: Color.fromARGB(225, 75, 1, 1)),
                              onPressed: () => _unfavCard(detail),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
