import 'package:flutter/material.dart';
import 'package:module_3/profile_registration.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String _title = 'Edit Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(
          onSubmit: (String value) {},
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key, required this.onSubmit}) : super(key: key);

  final ValueChanged<String> onSubmit;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  String _email_address = '';
  String _username = '';
  String _phone = '';
  String _address = '';
  String _password = '';
  String _repeat_password = '';
  bool _submitted = false;

  void _saveprofile() {
    //validate the form fields
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_email_address);
      widget.onSubmit(_username);
      widget.onSubmit(_phone);
      widget.onSubmit(_address);
      widget.onSubmit(_password);
      widget.onSubmit(_repeat_password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              // child: const Text(
              //   'User Login',
              //   style: TextStyle(
              //       color: Colors.blueGrey,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 30),
              // )
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email address',
                          ),
                          autovalidateMode: _submitted
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field required';
                            } else if (!RegExp(r'\S+@\S+\.\S+')
                                .hasMatch(text)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onChanged: (text) =>
                              setState(() => _email_address = text),
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter username',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter username';
                          } else if (text.length < 8) {
                            return 'username must be at least 8 characters!';
                          }
                          return null;
                        },
                        onChanged: (text) => setState(() => _username = text),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter mobile number',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'field required';
                          } else if (!RegExp(r"^(\d+)*$").hasMatch(text)) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                        onChanged: (text) => setState(() => _phone = text),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter address',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter address';
                          }
                          return null;
                        },
                        onChanged: (text) => setState(() => _username = text),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter new password',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter new password';
                          } else if (text.length < 8) {
                            return 'password must be at least 8 characters!';
                          }
                          return null;
                        },
                        onChanged: (text) => setState(() => _password = text),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm password',
                        ),
                        autovalidateMode: _submitted
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please re-confirm password';
                          } else if (text.length < 8) {
                            return 'password must be at least 8 characters!';
                          } else if (text != _password) {
                            return 'password must be the same';
                          }
                          return null;
                        },
                        onChanged: (text) =>
                            setState(() => _repeat_password = text),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Save',
                        ),
                        onPressed: (_email_address.isNotEmpty ||
                                _password.isNotEmpty ||
                                _repeat_password.isNotEmpty
                            ? _saveprofile
                            : null),
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}

//this is the forgotpassword screen includinng the 2 features screens
// for
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
    );
  }
}

class FirstFeature extends StatelessWidget {
  const FirstFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Feature'),
      ),
    );
  }
}

class SecondFeature extends StatelessWidget {
  const SecondFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Feature'),
      ),
    );
  }
}
