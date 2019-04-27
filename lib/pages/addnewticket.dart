import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:train_ticket_exchange/pages/myaccount.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class AddNewTicket extends StatefulWidget {
  @override
  _AddNewTicketState createState() => _AddNewTicketState();
}

class _AddNewTicketState extends State<AddNewTicket> {

  String startStation, endStation, dateTime, price, purpose, ticketType, compartment, seatNo, contactNo;

  String id;

  final db = Firestore.instance;

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
                      validator: (input){
                        if (input.isEmpty){
                          return "Please enter the Start Station";
                        }
                      },
                      onSaved: (input) => startStation = input,
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
                      validator: (input){
                        if (input.isEmpty){
                          return "Please enter the End Station";
                        }

                      },
                      onSaved: (input) => endStation = input,
                          decoration: InputDecoration(
                              labelText: 'END STATION',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                        ),
                        SizedBox(height: 20.0),
//                        DateTimePickerFormField(
////                          validator: (input){
////                            if (input.i){
////                              return "Please enter the End Station";
////                            }
////
////                          },
//                          onSaved: (input) => dateTime = date,
//                          inputType: inputType,
//                          format: formats[inputType],
//                          editable: editable,
//                          decoration: InputDecoration(
//                              labelText: 'START DATE & TIME',
//                              labelStyle: TextStyle(
//                                  fontFamily: 'Montserrat',
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.grey),
//                              focusedBorder: UnderlineInputBorder(
//                                  borderSide: BorderSide(color: Colors.green))),
//                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                      validator: (input){
                        if (input.isEmpty){
                          return "Please enter the ticket price";
                        }

                      },
                      onSaved: (input) => price = input,
                          decoration: InputDecoration(
                              labelText: 'PRICE',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                        ),
                        SizedBox(height: 20.0),
                        new FormField<String>(
                          validator: (input){
                            if (input.isEmpty){
                              return "Please select the purpose";
                            }

                          },
                          onSaved: (input) => purpose = input,
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
                          validator: (input){
                            if (input.isEmpty){
                              return "Please select the ticket type";
                            }

                          },
                          onSaved: (input) => ticketType = input,
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
                          validator: (input){
                            if (input.isEmpty){
                              return "Please select the compartment ";
                            }

                          },
                          onSaved: (input) => compartment = input,
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
                      validator: (input){
                        if (input.isEmpty){
                          return "Please enter the seat number";
                        }

                      },
                      onSaved: (input) => seatNo = input,
                          decoration: InputDecoration(
                              labelText: 'SEAT NO',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                      onSaved: (input) => contactNo = input,
                          decoration: InputDecoration(
                              labelText: 'CONTACT NO',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

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
                              onTap: addTicket,
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

  addTicket() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try{
        DocumentReference ref = await db.collection('TicketDetails').add(
            {
              'startStation':startStation,
              'endStation':endStation,
              'price':price,
              'purpose':purpose,
              'ticketType':ticketType,
              'compartment':compartment,
              'seatNo':seatNo,
              'contactNo':contactNo,
            });
        setState(() => id = ref.documentID);
        Navigator.push(context, new MaterialPageRoute(builder: (context) => MyAccount()));
      }catch(e){
        print(e);
      }
    }

  }


}
