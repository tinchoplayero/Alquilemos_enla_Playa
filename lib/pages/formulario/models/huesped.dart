import 'package:cloud_firestore/cloud_firestore.dart';

class Huesped {
  final String alias;
  final double depto;

  Huesped({
    required this.alias,
    required this.depto,
  });

  factory Huesped.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return Huesped(
      alias: doc.data()!['alias'] ?? '',
      depto: doc.data()!['depto'] ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alias': alias,
      'depto': depto,
    };
  }
}
