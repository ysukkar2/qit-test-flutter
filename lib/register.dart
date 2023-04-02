import 'package:flutter/material.dart';
import 'package:qittest/logo.dart';
import 'package:http/http.dart';

import 'login.dart';
class Register extends StatefulWidget {
   Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordconfirmController  =TextEditingController();
  void login(String email , password, name, confirmpassword) async{
    
    try{
     
      Response response = await post(
        
      Uri.parse("https://test.qit.company/api/user/register"),
        body: {
         
          'email':email,
          'password':password,
          'name':name,
          'password_confirmation':confirmpassword,
        }
      );
      if(response.statusCode ==200){
     
        print('account created success'); 
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
            title: Text('signup'),
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



                 TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name'
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordconfirmController,
                  decoration: InputDecoration(
                    hintText: 'Password Confirm'
                  ),
                ),

                SizedBox(height: 40,),
                GestureDetector(
                  
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                    login(emailController.text.toString(),passwordController.text.toString(),nameController.text.toString(),passwordconfirmController.text.toString());
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Sign Up'),
                    ),
                  ),
                ),
              ],
          
            ),
          ),
    );
    
  }
}