import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:flutter_lab2/services/UserService.dart';
import 'package:flutter_lab2/state/actions/User.actions.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';

typedef OnPostAddedCallback = Function();

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  UserModel receivedUser;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(Function callback) {
    if (_formKey.currentState.validate()) {
      UserService.login(
        usernameController.text,
        passwordController.text
      ).then(
        (user) => onUserReceived(user, callback)
      );
    }
  }

  void onUserReceived(UserModel user, Function callback) {
    receivedUser = user;
    Navigator.pushNamed(context, '/');
    callback();
  }

  getForm(Function callback) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: usernameController,
              cursorColor: appStyleMode.purpureus,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Username',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              cursorColor: appStyleMode.purpureus,
              obscureText: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child:
                    const Text('Login', style: TextStyle(fontSize: 20)),
                  ),
                  textColor: appStyleMode.background,
                  color: appStyleMode.fuzzy,
                  onPressed: () {
                    login(callback);
                  },
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      child:
                      const Text('Registration', style: TextStyle(fontSize: 20)),
                    ),
                    textColor:  Colors.grey,
                    color: appStyleMode.background,
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppStore, OnPostAddedCallback>(
        converter: (store) {
          return () =>
              // store.dispatch(AddPostAction(PostModel.createPost(currentUser, image)));
          store.dispatch(SetCurrentUserAction(receivedUser));
        },
        builder: (context, callback) {
          return getForm(callback);
        }
    );
  }
}