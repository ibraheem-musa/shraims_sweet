import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/widget/Drawer_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

bool isSwitched = false;

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorForDesign().black,
      // drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: ColorForDesign().black,
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: Container(
        color: ColorForDesign().black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: OutlinedButton(
                  onPressed: () {},
                  style:
                      OutlinedButton.styleFrom(primary: ColorForDesign().Gold),
                  child: Row(
                    children: [
                      Text(
                        "Account info",
                        style: TextStyle(color: ColorForDesign().Gold),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorForDesign().Gold,
                      )
                    ],
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: OutlinedButton(
                  onPressed: () {},
                  style:
                      OutlinedButton.styleFrom(primary: ColorForDesign().Gold),
                  child: Row(
                    children: [
                      Text(
                        "Change email",
                        style: TextStyle(color: ColorForDesign().Gold),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorForDesign().Gold,
                      )
                    ],
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: OutlinedButton(
                  onPressed: () {},
                  style:
                      OutlinedButton.styleFrom(primary: ColorForDesign().Gold),
                  child: Row(
                    children: [
                      Text(
                        "Change passwword",
                        style: TextStyle(color: ColorForDesign().Gold),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorForDesign().Gold,
                      )
                    ],
                  )),
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: ColorForDesign().Gold,
              endIndent: 5,
              indent: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    children: [
                      Text(
                        "Notification ",
                        style: TextStyle(
                            color: ColorForDesign().Gold, fontSize: 16),
                      ),
                      Expanded(child: SizedBox()),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        inactiveTrackColor: ColorForDesign().Gold,
                        activeTrackColor: Colors.white,
                        activeColor: ColorForDesign().Gold,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
