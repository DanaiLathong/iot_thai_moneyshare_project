import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_thai_moneyshare_project/views/money_result_ui.dart';

class MoneyInputUI extends StatefulWidget {
  const MoneyInputUI({super.key});

  @override
  State<MoneyInputUI> createState() => _MoneyInputUIState();
}

class _MoneyInputUIState extends State<MoneyInputUI> {
  bool isTip = false;

  TextEditingController moneyCtrl = TextEditingController();
  TextEditingController personCtrl = TextEditingController();
  TextEditingController tipCtrl = TextEditingController();

  showWarningMSG(context, msg) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('คำเตือน'),
          content: Text(msg),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            'เเชร์เงินกันเถอะ',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 45.0,
              right: 45.0,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Image.asset(
                    'assets/images/money.png',
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.blueAccent,
                        ),
                        hintText: 'ป้อนจำนวนเงิน (บาท)',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blueAccent,
                        ),
                        hintText: 'ป้อนจำนวนคน (คน)',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isTip,
                        onChanged: (paramValue) {
                          setState(() {
                            isTip = paramValue!;
                            if (isTip == false) {
                              tipCtrl.text = '';
                            }
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.blueAccent,
                        side: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'ทิปให้พนักงานเสริฟ',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    controller: tipCtrl,
                    enabled: isTip,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.coins,
                          color: Colors.blueAccent,
                        ),
                        hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        50.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'คํานวณเงิน',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (moneyCtrl.text.length == 0) {
                        showWarningMSG(context, 'กรุณาป้อนจํานวนเงิน !!!!');
                      } else if (personCtrl.text.length == 0) {
                        showWarningMSG(context, 'กรุณาป้อนจํานวนคน !!!!');
                      } else if (isTip == true && tipCtrl.text.length == 0) {
                        showWarningMSG(context, 'กรุณาป้อนจํานวนเงินทิป !!!!');
                      } else {
                        double money = double.parse(moneyCtrl.text);
                        int person = int.parse(personCtrl.text);
                        double tip =
                            isTip == true ? double.parse(tipCtrl.text) : 0;
                        double moneyShare = (money + tip) / person;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoneyResultUI(
                              money: money,
                              tip: tip,
                              person: person,
                              moneyShare: moneyShare,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        50.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                    label: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        moneyCtrl.text = '';
                        personCtrl.text = '';
                        isTip = false;
                        tipCtrl.text = '';
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'Create by Gun SAU',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
