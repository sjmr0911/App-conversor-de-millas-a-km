import 'package:flutter/material.dart';

void main() {
  runApp(ConversorMillasKm());
}

class ConversorMillasKm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          title: Text('Convertidor de millas a kilómetros', 
          style: TextStyle(
              color: Color.fromARGB(255, 0, 42, 114), // Color del texto del título
              fontWeight: FontWeight.w800,
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontFamily: 'Roboto',
            ),)),
        body: ConversorWidget(),
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
      ),
    );
  }
}

class ConversorWidget extends StatefulWidget {
  @override
  _ConversorWidgetState createState() => _ConversorWidgetState();
}

class _ConversorWidgetState extends State<ConversorWidget> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';
  String _error = '';
  double? millas;
  double? kilometros;

  void convertir() {
    setState(() {
      _error = '';
      _resultado = '';
      kilometros = null;
      millas = null;

      final texto = _controller.text.trim();

      if (texto.isEmpty) {
        _error = 'Por favor ingrese un número';
        return;
      }

      final millasParsed = double.tryParse(texto);
      if (millasParsed == null) {
        _error = 'Entrada no válida';
        return;
      }

      millas = millasParsed;
      kilometros = millas! * 1.60934;
      _resultado = '${millas!.toStringAsFixed(2)} millas equivalen a ${kilometros!.toStringAsFixed(2)} km';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Convertir de millas a Km',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange,),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          TextField(
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Color.fromARGB(255, 51, 102, 214),),
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Ingrese las millas',
              labelStyle: TextStyle(color: Color.fromARGB(255, 51, 102, 214)),
              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 51, 102, 214), width: 2),
              ),
              errorText: _error.isEmpty ? null : _error,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: convertir,
            style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 0, 42, 114), 
            foregroundColor: Colors.orange,
            ),
            child: Text('Convertir'),
            

          ),
          SizedBox(height: 20),
          if (_resultado.isNotEmpty)
            Column(
              children: [
                Text(_resultado, style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Millas: ${millas!.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        )),
                    SizedBox(width: 20),
                    Text('Kilómetros: ${kilometros!.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}
