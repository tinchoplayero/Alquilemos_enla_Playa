import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getHuespedes() async {
  List<Map<String, dynamic>> huespedes = [];
  CollectionReference collectionReferenceHuespedes = db.collection("Huespedes");

  QuerySnapshot queryHuespedes = await collectionReferenceHuespedes.get();

  queryHuespedes.docs.forEach((documento) {
    final data = documento.data() as Map<String, dynamic>;
    huespedes.add(data);
  });

  return huespedes;
}

Future<List<Map<String, dynamic>>> getUltimosHuespedes() async {
  List<Map<String, dynamic>> huespedes = [];
  CollectionReference collectionReferenceHuespedes = db.collection("Huespedes");

  QuerySnapshot queryHuespedes = await collectionReferenceHuespedes.limit(5).get();

  queryHuespedes.docs.forEach((documento) {
    final data = documento.data() as Map<String, dynamic>;
    huespedes.add(data);
  });

  return huespedes;
}

