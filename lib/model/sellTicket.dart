import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewTicket extends StatefulWidget {
  final Widget page;
  final String collectionName;
  const AddNewTicket(this.collectionName, this.page);
  @override
  _AddNewTicketState createState() => _AddNewTicketState();
}

class _AddNewTicketState extends State<AddNewTicket> {
  String route,
      startStation,
      endStation,
      price,
      purpose,
      ticketType,
      compartment,
      seatNo,
      contactNo;

  DateTime dateTime;
  String id;
  final db = Firestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final formats = {};

  InputType inputType = InputType.both;
  bool editable = true;

  List<String> ticketCats = <String>[
    '1st Class AC',
    '1st Class OBV',
    '1st Class Normal',
    '2nd Class',
    '3rd Class',
    ''
  ];
  String ticketCato = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text('Ticket Details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        resizeToAvoidBottomPadding: true,
        body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Please enter the Start Station";
                            }
                            return null;
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
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Please enter the End Station";
                            }
                            return null;
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
                        DateTimePickerFormField(
                          validator: (input) {
                            if (input == null) {
                              return "Please select Start Date & Time";
                            }
                            return null;
                          },
                          onSaved: (input) => dateTime = input,
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
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Please enter the ticket price";
                            }
                            return null;
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
                          validator: (input) {
                            if (input == null) {
                              return 'Please select ticket category';
                            }
                            return null;
                          },
                          onSaved: (input) => ticketCato = input,
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'TICKET CATEGORY',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                errorText:
                                    state.hasError ? state.errorText : null,
                              ),
                              isEmpty: ticketCato == '',
                              child: new DropdownButtonHideUnderline(
                                child: new DropdownButton<String>(
                                  value: ticketCato,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      ticketCato = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: ticketCats.map((String value) {
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
                              onTap: () =>
                                  addTicket(widget.collectionName, widget.page),
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
            )));
  }
  addTicket(String collectionName, Widget widgetpage) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        DocumentReference ref = await db
            .collection(collectionName)
            .document(ticketCato)
            .collection("Tickets")
            .add({
          'startStation': startStation,
          'endStation': endStation,
          'price': price,
          'ticketType': ticketCato,
          'contactNo': contactNo,
          'dateTime': dateTime,
        });
        setState(() => id = ref.documentID);
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => widgetpage));
      } catch (e) {
        print(e);
      }
    }
  }
}
