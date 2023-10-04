import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class BotonDepto extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color botonColor;

  const BotonDepto({
    Key? key,
    required this.text,
    required this.press,
    this.botonColor = BotonAlquilemos.primaryColor,
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.3, size.height * 0.15),
                    backgroundColor:botonColor,
                  ),
                  onPressed: press,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: size.width * 0.1,
                      color: Colors.white,
                    ),
                  ),
                ),
    );
  }
}
