import 'package:first_app_for_test/Colors.dart';
import 'package:flutter/material.dart';

class MessageandNot extends StatefulWidget {
  const MessageandNot({key}) : super(key: key);

  @override
  _MessageandNotState createState() => _MessageandNotState();
}

class _MessageandNotState extends State<MessageandNot> {
  String Name;
  String Email;
  String phone;
  String supject;
  String Message;
var contactformkey = GlobalKey<FormState>();
   CheckifTheTextBoxEmpty() {
    if (!contactformkey.currentState.validate()) {
      return null;
    } else {
      contactformkey.currentState.save();
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: ColorForDesign().black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: contactformkey,
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: ColorForDesign().Gold),
                  cursorColor:  ColorForDesign().Gold,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Your Name",
                    labelStyle: TextStyle(color:  ColorForDesign().Gold),
                    fillColor: Colors.amber,
                    hintStyle: TextStyle(color:  ColorForDesign().Gold),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: ColorForDesign().Gold,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this value is mandatory";
                    }
                    return null;
                  },
                  onSaved: (newvalue) {
                    Name = newvalue;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color:  ColorForDesign().Gold),
                  cursorColor:  ColorForDesign().Gold,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Your Email",
                    labelStyle: TextStyle(color:  ColorForDesign().Gold),
                    fillColor: Colors.amber,
                    // hoverColor: Colors.amber,
                    // hintText: "Enter Email",
                    hintStyle: TextStyle(color:  ColorForDesign().Gold),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this value is mandatory";
                    }
                    return null;
                  },
                  onSaved: (newvalue) {
                    Email = newvalue;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: ColorForDesign().Gold),
                  cursorColor:  ColorForDesign().Gold,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Your Phone",
                    labelStyle: TextStyle(color:  ColorForDesign().Gold),
                    fillColor: Colors.amber,
                    // hoverColor: Colors.amber,
                    // hintText: "Enter Email",
                    hintStyle: TextStyle(color:  ColorForDesign().Gold),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this value is mandatory";
                    }
                    return null;
                  },
                  onSaved: (newvalue) {
                    phone = newvalue;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color:  ColorForDesign().Gold),
                  cursorColor:  ColorForDesign().Gold,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "the message Subject ...",
                    labelStyle: TextStyle(color:  ColorForDesign().Gold),
                    fillColor: Colors.amber,
                    // hoverColor: Colors.amber,
                    // hintText: "Enter Email",
                    hintStyle: TextStyle(color:  ColorForDesign().Gold),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this value is mandatory";
                    }
                    return null;
                  },
                  onSaved: (newvalue) {
                    supject = newvalue;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5, 
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color:  ColorForDesign().Gold),
                  cursorColor:  ColorForDesign().Gold,
                   decoration: InputDecoration(
                    labelText: "Message .....",
                    labelStyle: TextStyle(color:  ColorForDesign().Gold),
                    fillColor: Colors.amber,
                    // hoverColor: Colors.amber,
                    // hintText: "Enter Email",
                    hintStyle: TextStyle(color:  ColorForDesign().Gold),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:  ColorForDesign().Gold,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "this value is mandatory";
                    }
                    return null;
                  },
                  onSaved: (newvalue) {
                    Message = newvalue;
                  },
                ),
              ),
              OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                primary:  ColorForDesign().black,
                                backgroundColor:  ColorForDesign().Gold,
                                fixedSize: Size(200, 35)),
                            onPressed: () {
                              CheckifTheTextBoxEmpty();
                            },
                            child: Text('Send',
                                style: TextStyle(
                                    fontSize: 20, color:  ColorForDesign().black)),
                          ),
                        
            ],
          ),
        )),
      ),
    );
  }
}
