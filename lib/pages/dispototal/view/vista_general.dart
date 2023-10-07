import '/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaGeneral extends StatelessWidget {
  static const name = 'vista-general';
  const VistaGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Lista para ${user.email ?? "Desconocido"}"),
        ),
        body: FutureBuilder(
          future: getHuespedes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final data = snapshot.data as List<Map<String, dynamic>>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final alias = data[index]["alias"];
                  final depto = data[index]["depto"];
                  final fecha = data[index]["fecha"];
                  if (alias != null) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            "${alias} ingresa el depto ${depto} el ${fecha}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.edit),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text("Huespedes no definidos");
                  }
                },
              );
            } else {
              return Text("No se encontraron datos.");
            }
          },
        ));
  }
}
