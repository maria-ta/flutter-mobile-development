import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:provider/provider.dart';

class SandboxNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child:
                    const Text('Animations', style: TextStyle(fontSize: 20)),
                  ),
                  textColor:  Colors.grey,
                  color: appStyleMode.background,
                  onPressed: () {
                    Navigator.pushNamed(context, '/animations');
                  },
                )
            )
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              child: ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      child:
                      const Text('Posts Fetched', style: TextStyle(fontSize: 20)),
                    ),
                    textColor:  Colors.grey,
                    color: appStyleMode.background,
                    onPressed: () {
                      Navigator.pushNamed(context, '/posts-placeholder');
                    },
                  )
              )
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              child: Switch(
                value: appStyleMode.darkMode,
                onChanged: (value)=> appStyleMode.switchMode(!appStyleMode.darkMode),
              ),
          ),
        ],
      ),
    );
  }

}