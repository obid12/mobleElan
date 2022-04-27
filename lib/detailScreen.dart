import 'package:flutter/material.dart';
import 'package:materi3/data.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final BtsMember member;
  DetailScreen({required this.member});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(member.imageAsset),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                member.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                member.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: member.imageUrls.map((aset) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(aset),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
