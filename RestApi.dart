import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RestApi extends StatefulWidget {
  const RestApi({super.key});

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {

  List<Map<String,dynamic>> datalist=[];
  var namecontroler = new TextEditingController();
  //get data
  @override
  void initState() {
    getData();
    super.initState();
  }
  Future<void> getData() async {
    final response=await http.get(Uri.parse('https://66ed096d380821644cdb0fde.mockapi.io/student'),);
    if(response.statusCode == 200){
      List<dynamic> jsondata=jsonDecode(response.body);
      setState(() {
        datalist=jsondata.cast<Map<String,dynamic>>();
      });
    }
    print(datalist);
  }
  //update data
  Future<void> update(String id, Map<String, dynamic> map) async {
    namecontroler.text=map["name"];
    try {
      final response = await http.put(
        Uri.parse('https://66ed096d380821644cdb0fde.mockapi.io/student/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        print('Update successful');
        getData();
      } else {
        print('Failed to update: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error updating data: $error');
    }
  }
  //post data
  Future<void> postData(Map<String, dynamic> map) async {
    final response = await http.post(
      Uri.parse('https://66ed096d380821644cdb0fde.mockapi.io/student/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(map),
    );
    if (response.statusCode == 201) {
      print('Post successful');
      getData();
    } else {
      print('Failed to post');
    }
  }
  Future<void> deleteData(String id) async {
    final response = await http.delete(Uri.parse('https://66ed096d380821644cdb0fde.mockapi.io/student/$id'),
    );
    if(response.statusCode==200){
      print("delete succfully");
    }else{
      print("error :: :");
    }
    getData();
  }  //show buttom sheet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api crud'),
      ),
      body: SafeArea(child: Column(
        children: [
          TextField(
            controller: namecontroler,
          ),
          ElevatedButton(
              onPressed: (){
                Map<String,dynamic> map ={};
                map['name']=namecontroler.text;
                postData(map);
                namecontroler.clear();
              }, child: Text("add")
          ),
          Expanded(child: ListView.builder(itemCount: datalist.length,itemBuilder: (context, index) {
            var updatedcontroller=new TextEditingController(text: datalist[index]["name"]);
            return ListTile(
              leading: CircleAvatar(
                child: Text(datalist[index]['id']),
              ),
              title: Text(datalist[index]['name']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){
                    showModalBottomSheet(context: context, builder: (context) {
                      return Column(
                        children: [
                          TextField(
                            controller: updatedcontroller,
                          ),
                          ElevatedButton(onPressed: (){
                            Map<String,dynamic> map ={};
                            map['name']=updatedcontroller.text;
                            update(datalist[index]['id'].toString(),map);
                            Navigator.pop(context);
                          }, child: Text("edit"))
                        ],
                      );
                    },);
                  }, icon: Icon(Icons.edit)),
                  SizedBox(width: 10,),
                  IconButton(onPressed: (){
                    deleteData(datalist[index]['id'].toString());
                  }, icon: Icon(Icons.delete))
                ],
              ),
            );
          },))
        ],
      )),
    );
  }
}