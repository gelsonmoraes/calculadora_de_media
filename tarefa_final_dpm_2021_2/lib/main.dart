import 'package:flutter/material.dart';
import './home.dart';

void main() {
  runApp(MaterialApp(
      title: "Tarefa Final DPM 2021.2",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}

