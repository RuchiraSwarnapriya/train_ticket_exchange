import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';



class AddNewTicket extends StatefulWidget {
  @override
  _AddNewTicketState createState() => _AddNewTicketState();
}

class _AddNewTicketState extends State<AddNewTicket> {

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
  };

  InputType inputType = InputType.both;
  bool editable = true;

  List<String> _ticketTypes = <String>['', '1st Class', '2nd Class', '3rd Class',];
  String _ticketType = '';

  List<String> _compartments = <String>['','OFV','A', 'B', 'C', 'D', 'F','G','H','I'];
  String _compartment = '';

  List<String> _purposes = <String>['','Sale','Exchange'];
  String _purpose = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: new IconThemeData(color:Colors.black),
          title: Text('Ticket Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black)),
        ),
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
                              labelText: 'START STATION',
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
                              labelText: 'END STATION',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        DateTimePickerFormField(
                          inputType: inputType,
                          format: formats[inputType],
                          editable: editable,
                          decoration: InputDecoration(
                              labelText: 'START DATE & TIME',
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
                              labelText: 'PRICE',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        new FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: 'PURPOSE',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))
                              ),
                              isEmpty: _purpose == '',
                              child: new DropdownButtonHideUnderline(
                                child: new DropdownButton<String>(
                                  value: _purpose,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _purpose = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _purposes.map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20.0),
                        new FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: 'TICKET TYPE',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))
                              ),
                              isEmpty: _ticketType == '',
                              child: new DropdownButtonHideUnderline(
                                child: new DropdownButton<String>(
                                  value: _ticketType,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _ticketType = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _ticketTypes.map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20.0),
                        new FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'COMPARTMENT',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))
                              ),
                              isEmpty: _compartment == '',
                              child: new DropdownButtonHideUnderline(
                                child: new DropdownButton<String>(
                                  value: _compartment,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _compartment = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _compartments.map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
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
                              labelText: 'SEAT NO',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
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
                              labelText: 'CONTACT NO',
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
                                      builder: (context) => AddNewTicket())),
                              child: Center(
                                child: Text(
                                  'SUBMIT',
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

              ],
            ))
    );
  }


}
