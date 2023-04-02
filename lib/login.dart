import 'package:flutter/material.dart';
//import 'package:qittest/logo.dart';
import 'package:http/http.dart';

import 'logo.dart';

//import 'logo.dart';
class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController nameController = TextEditingController();
  //TextEditingController passwordconfirmController  =TextEditingController();
  void login(String email , password) async{
    
    try{
     
      Response response = await post(
        
      Uri.parse("https://test.qit.company/api/user/login"),
        body: {
         
          'email':email,
          'password':password,
          
          
        }
      );
      if(response.statusCode ==200){
     
        print('login success'); 
      }else{
        print('failed');
      }
    
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email'
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password'
                  ),
                ),
                SizedBox(height: 20,),



                
                SizedBox(height: 40,),
                GestureDetector(
                  
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Logo()));
                    login(emailController.text.toString(),passwordController.text.toString());
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Login'),
                    ),
                  ),
                ),
              ],
          
            ),
          ),
    );
    
  }
}