import 'package:flutter/material.dart';

import 'home_page.dart';
import 'third_screen.dart';


/*class SecondScreen extends StatelessWidget {

  final String text;
  SecondScreen(String text): this.text = text;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context, MyHomePage());
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //text,
              "Second Screen",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}*/


class SecondScreen extends StatefulWidget {

  final String text;


  SecondScreen(String text): this.text = text;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  //int _mobile = int.parse('');
  
  Widget _buildNameField(){
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
        labelText: 'Name', 
        hintText: 'Enter Your Full Name'
      ),
      validator: (text){
        return HelperValidator.nameValidate(text!);
      },
      onSaved: (value){
        _name = value!;
      },
    );
  }

  Widget _buildEmailField(){
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
        labelText: 'Email', 
        hintText: 'Enter Your Email'
      ),
      validator: (text){
        if(text!.isEmpty){
          return "Please enter valid email";
        }
        return null;
      },
      onSaved: (value){
        _email = value!;
      },
    );
  }

  Widget _buildPasswordField(){
    return TextFormField(
      obscureText: true,
      maxLength: 10,
      decoration: InputDecoration(
        labelText: 'Password', 
        hintText: 'Enter Your Email'
      ),
      validator: (text){
        if(text!.isEmpty){
          return "Please enter a password";
        }
        return null;
      },
      onSaved: (value){
        _password = value!;
      },
    );
  }

  /*Widget _buildMobileNumberField() {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a mobile Number";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Mobile Number', 
        hintText: 'Enter a mobile number'
      ),
      onSaved: (String? value) {
       if (value != null) {
        _mobile = int.parse(value);
      }
      },
    );
  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Forms"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context, MyHomePage());
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildNameField(),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildEmailField(),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPasswordField(),
              ),

              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildMobileNumberField(),
              ),*/

              SizedBox(height: 50),

              Container(
                width: 150,
                child: ElevatedButton(
                  child : Text('Submit'),
                  onPressed : (){
                    if(_formKey.currentState!.validate()){
                      print('valid form');
                      _formKey.currentState!.save();
                    } else {
                      print("not valid form");
                      return;
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),

      floatingActionButton:FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return ThirdScreen("Hello");
            }));
            //Navigator.of(context).pushNamed('/second');
          },
        ) ,
    );
  }
}

class HelperValidator{
  static String? nameValidate(String value){
    if(value.isEmpty){
      return "Name can't be empty";
    }
    if (value.length<2){
      return "Name must be at least 2 characters long";
    }
    if(value.length>50){
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}