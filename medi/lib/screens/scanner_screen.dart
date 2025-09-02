import 'package:flutter/material.dart';


class ScannerScreen extends StatelessWidget {
const ScannerScreen({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Scan Prescription'),
),
body: Center(
child: ElevatedButton.icon(
icon: const Icon(Icons.document_scanner),
label: const Text('Upload Prescription'),
onPressed: () {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('OCR Service Coming Soon!')),
);
},
),
),
);
}
}