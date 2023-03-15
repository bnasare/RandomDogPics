import 'classdogs.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
void main(){
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dog? dog;
  String dogmessage="";
  String dogstatus ="";

  fetchDog() async{
    Uri url = Uri.parse("https://dog.ceo/api/breeds/image/random");

    final response = await http.get(url);
    
    if (response.statusCode==200){
      final body= json.decode(response.body) as Map<String, dynamic>;
      setState(() {
        dog = Dog.fromJson(body);
        dogmessage = dog!.message;
        dogstatus = dog!.status;
      });
    } else {
      print('Failed to load new picture');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: const Text('Dogs', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 30 ),),
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      backgroundColor: Colors.blueAccent,
      shadowColor: Colors.white,
      ),
      
    body: 
      
        Padding(
          padding: const EdgeInsets.all(3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70,),
                Center(child: Container(
                  width: 400,
                  height: 400,
                  decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35))
                  ),
                  child: Image(image: NetworkImage(dogmessage)))),
                const SizedBox(height: 70,),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed: () async {
                  await fetchDog();
                }, 
                child: const Center(child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Text("Get another dog's picture", style: TextStyle(fontSize: 20),),
                ))
                        ),
              )],
              
              
              
              
                  
              ),
          )
    ),
    backgroundColor: Colors.black,
    );
  }}