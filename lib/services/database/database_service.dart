import 'package:cloud_firestore/cloud_firestore.dart';
import '../../pages/formulario/models/huesped.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addHuesped(String alias, double depto, String fecha) async {
    await _db.collection('Huespedes').add({
      'alias': alias,
      'depto': depto,
      'fecha': fecha,
    });
  }

  Future<List<Huesped>> getHuespedes() async {
    QuerySnapshot<Map<String, dynamic>> huespedesSnapshot =
        await _db.collection('Huespedes').get();

    final List<Huesped> listaHuespedes = huespedesSnapshot.docs.map((doc) {
      return Huesped.fromDocumentSnapshot(doc);
    }).toList();
    return listaHuespedes;
  }

  Stream<List<Huesped>> getHuespedesStream() {
    Stream<QuerySnapshot<Map<String, dynamic>>> huespedesStream =
        _db.collection('Huespedes').snapshots();

    // final List<Huesped> listaHuespedes = huespedesSnapshot.docs.map((doc) {
    //   return Huesped.fromDocumentSnapshot(doc);
    // }).toList();
    // return listaHuespedes;
    return huespedesStream.map((snapshot) {
      return snapshot.docs
          .map((doc) => Huesped.fromDocumentSnapshot(doc))
          .toList();
    });
  }

  Future<void> saveDummyData() async {
    final huespedes = [
      {
        'alias': 'Benito',
        'depto': 2.0,
      },
      
    ];

    for (var huesped in huespedes) {
      await _db.collection('Huespedes').add(huesped);
    }
  }
}
