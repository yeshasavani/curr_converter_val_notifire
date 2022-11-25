import 'dart:convert';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class second extends StatelessWidget {

  ValueNotifier<String> fir = ValueNotifier("USD");
  ValueNotifier<String> sec = ValueNotifier("INR");
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  ValueNotifier<double> ans = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Convertor"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        theme: CurrencyPickerThemeData(
                          flagSize: 25,
                          titleTextStyle: TextStyle(fontSize: 17),
                          subtitleTextStyle: TextStyle(
                              fontSize: 15, color: Theme.of(context).hintColor),
                          bottomSheetHeight:
                          MediaQuery.of(context).size.height / 1.5,
                        ),
                        showFlag: true,
                        showSearchField: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          print('Select currency: ${currency.name}');
                          fir.value = currency.code;
                        },
                        favorite: ['USD'],
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(left: 30),
                      // color: Colors.cyan,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          alignment: Alignment.center,
                          child: ValueListenableBuilder(
                            valueListenable: fir,
                            builder: (context, value, child) {
                              return Text(
                                "$value",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            },
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        theme: CurrencyPickerThemeData(
                          flagSize: 25,
                          titleTextStyle: TextStyle(fontSize: 17),
                          subtitleTextStyle: TextStyle(
                              fontSize: 15, color: Theme.of(context).hintColor),
                          bottomSheetHeight:
                          MediaQuery.of(context).size.height / 1.5,
                        ),
                        showFlag: true,
                        showSearchField: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          print('Select currency: ${currency.name}');
                          // setState(() {
                          //   sec = currency.code;
                          // });
                          sec.value = currency.code;
                        },
                        favorite: ['INR'],
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(left: 80),
                      // color: Colors.cyan,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          alignment: Alignment.center,
                          child: ValueListenableBuilder(
                            valueListenable: sec,
                            builder: (context, value, child) {
                              return Text(
                                "$value",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            },
                          )),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.cached_rounded,
                size: 40,
                color: Colors.white,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      padding: EdgeInsets.only(right: 20),
                      child: TextField(
                        controller: t1,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white30,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      padding: EdgeInsets.only(right: 20),
                      child: ValueListenableBuilder(
                        valueListenable: ans,
                        builder: (context, value, child) {
                          return Container(
                              width: 30,
                              color: Colors.white30,
                              child: Center(
                                child: Text(
                                  "${value}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () async {
                          String amount = t1.text;
                          var url = Uri.parse(
                              'https://aarchi123.000webhostapp.com/currency.php?to=${fir.value}&from=${sec.value}&amount=${amount}');
                          var response = await http.get(url);
                          print('Response status: ${response.statusCode}');
                          print('Response body: ${response.body}');
                          Map m = jsonDecode(response.body);
                          ans.value = m['result'];
                          print(m['result']);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                        child: Text("GO")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}