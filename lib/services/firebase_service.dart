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
