import 'package:flutter/material.dart';
import 'package:translator/app/data/text_style.dart';

class SearchBarLanguages extends StatelessWidget {
  const SearchBarLanguages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 12.0, top: 15.0, bottom: 10.0, right: 12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 0.8)
            ]),
        child: Row(
          children: [
            Expanded(
                child: Container(
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextField(
                  style: searchLangStyle,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: searchLangHint),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
