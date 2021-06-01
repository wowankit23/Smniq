import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String title = "";
  String username = "";
  String comname = "";
  String email = "";
  String emailC = "";
  String request = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Smniq"),
          centerTitle: true,
          leading: BackButton(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orangeAccent, Colors.redAccent],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft)),
          ),
        ),
        body:
        Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.8),
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.redAccent])),
                  child: Center(
                    child: Text(
                      "Contact Us",
                      style: TextStyle(fontSize: 27, color: Colors.white),
                    ),
                  )),
              Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                            "For inquiries, please use this form. \ nPlease fill in the inquiry details and click the OK button'。"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "subject",
                            hintStyle: TextStyle(fontWeight: FontWeight.w600),
                            border: OutlineInputBorder(),

                          ),
                          validator: (value) =>
                          value != null && value.length < 5 ? 'Please enter a subject' : null,
                          onSaved: (value) => title = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "company name",
                            hintStyle: TextStyle(fontWeight: FontWeight.w600),
                            border: OutlineInputBorder(),

                          ),
                          validator: (value) => value != null && value.length < 1
                              ? 'Please enter the company name'
                              : null,
                          onSaved: (value) => comname = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "name",
                            hintStyle: TextStyle(fontWeight: FontWeight.w600),
                            border: OutlineInputBorder(),


                          ),
                          validator: (value) => value != null && value.length < 1
                              ? 'Please enter your name.'
                              : null,
                          onSaved: (value) => username = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "mail address",
                            hintStyle: TextStyle(fontWeight: FontWeight.w600),
                            border: OutlineInputBorder(),
                            suffixIcon: Container(
                                width: 70,
                                height: 50,
                                ),
                          ),
                          validator: (value) => value != null && !value.contains('@')
                              ? 'Please enter the correct email address'
                              : null,
                          onSaved: (value) => email = value,
                        ),
                      ),

               ElevatedButton(
                        child: Text('Verification'),
                        onPressed: () {
                          flutterEmailSenderMail();
                        },
                      ),

                    ],
                  ))]));
  }

  flutterEmailSenderMail() async {
    final Email emailemail = Email(
      body: '${username.toString()}\n\n${comname.toString()}\n\n${emailC.toString()}\n${request.toString()}',
      subject: '${title.toString}',
      recipients: ['test12345@gmail.com'],
    );

    await FlutterEmailSender.send(emailemail);
  }
}

Widget buildText() {
  final text = 'test12345@gamil.com';

  return TextSelectionTheme(
    data: TextSelectionThemeData(
      // cursorColor: Colors.red,
      // selectionColor: Colors.orange,
      // selectionHandleColor: Colors.green,
    ),
    child: SelectableText(
      text,
      style: TextStyle(fontSize: 32),
      scrollPhysics: BouncingScrollPhysics(),
      toolbarOptions: ToolbarOptions(
        copy: true,
        paste: true,
        cut: true,
        selectAll: true,
      ),
      // maxLines: 10,
      showCursor: true,
      onSelectionChanged: (selection, cause) {},
    ),
  );
}