import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var ap = StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('Aprovgeral2017').snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        var tot = snapshot.data!.docs[0]['Total'];
        return tot;
      } else {
        return Text('aa');
      }
    });
