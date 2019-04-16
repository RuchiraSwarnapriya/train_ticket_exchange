import 'package:flutter/material.dart';
import 'package:train_ticket_exchange/pages/myaccount.dart';
import 'package:train_ticket_exchange/pages/signUppage.dart';
import 'package:train_ticket_exchange/pages/ticketdetails.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Form(
            key: _formKey,
            child: ListView(
//          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                      top: 35.0, left: 20.0, right: 20.0,),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
//                      validator: (input){
//                        if (input.isEmpty){
//                          return "Please enter the email Address";
//                        }
//                      },
//                      onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
//                      validator: (input){
//                        if (input.length < 8){
//                          return "Password Must be 8 Characters";
//                        }
//
//                      },
//                      onSaved: (input) => _password = input,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.grey,
                            color: Colors.black,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () =>
                                  Navigator.push(context, new MaterialPageRoute(
                                      builder: (context) => MyAccount())),
                              child: Center(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to Exchanger ?',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => SignUp())),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ))
    );
  }


  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
////        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
//        Navigator.push(context,new MaterialPageRoute(builder: (context)=> AddNewTicket()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}

