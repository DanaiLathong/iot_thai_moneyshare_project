import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyResultUI extends StatefulWidget {
  //สร้างตัวแปรมารับค่าที่ส่งมา
  double? money;
  int? person;
  double? tip;
  double? moneyShare;

  //เอาตัวแปรที่สร้างไว้มารับค่าที่ส่งมา
  MoneyResultUI({
    //constractor
    super.key,
    this.money,
    this.person,
    this.tip,
    this.moneyShare,
  });

  @override
  State<MoneyResultUI> createState() => _MoneyResultUIState();
}

class _MoneyResultUIState extends State<MoneyResultUI> {
  //ทำทศนิยม 2 ตำแหน่ง และ , คั่นหลักพันหลักล้าน....
  final numberFormat = NumberFormat('#,###.##');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 197, 249),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'แชร์เงินกันเถอะ (ผลลัพธ์)',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/money.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'จำนวนเงิน',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                // widget.money!.toStringAsFixed(2),
                numberFormat.format(widget.money!),
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 7, 84, 146),
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนคนที่จะหาร',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                widget.person!.toString(),
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 7, 84, 146),
                ),
              ),
              Text(
                'คน',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินทิป',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                // widget.tip!.toStringAsFixed(2),
                numberFormat.format(widget.tip!),
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 7, 84, 146),
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'สรุปว่าหารกันคนละ',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                // widget.moneyShare!.toStringAsFixed(2),
                numberFormat.format(widget.moneyShare!),
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 0, 0),
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
