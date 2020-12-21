import 'package:flutter/material.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:flutter_lab2/constants/Gradient.dart';
import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:flutter_lab2/models/mocks/Images.mock.dart';
import 'package:flutter_lab2/state/actions/Post.actions.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';

typedef OnPostAddedCallback = Function();

class CreatePost extends StatefulWidget {
  @override
  CreatePostState createState() {
    return CreatePostState();
  }
}

class CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();

  final imageController = TextEditingController(
    text: IMAGE_SRC,
  );
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    imageController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  getForm(OnPostAddedCallback callback) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      color: appStyleMode.background,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: imageController,
              cursorColor: appStyleMode.accentedText,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Image URL',
              ),
              style: TextStyle(
                  color: appStyleMode.text,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter image URL';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              cursorColor: appStyleMode.accentedText,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter post description';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: getStandartGradient(context),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child:
                  const Text('Create post', style: TextStyle(fontSize: 20)),
                ),
                textColor: appStyleMode.background,
                color: appStyleMode.fuzzy,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    callback();
                    Navigator.pop(context);
                  }
                },
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
          return () {
            UserModel currentUser = store.state.userStore.currentUser;
            String image = imageController.text;
            String description = descriptionController.text;
            store.dispatch(AddPostAction(PostModel.createPost(currentUser, image, description)));
          };
        },
        builder: (context, callback) {
          return getForm(callback);
        }
    );
  }
}