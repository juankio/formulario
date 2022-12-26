import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Preguntas extends StatefulWidget {
  const Preguntas({super.key});

  @override
  State<Preguntas> createState() => _PreguntasState();
}

class _PreguntasState extends State<Preguntas> {
  var cardTarjeta = new MaskTextInputFormatter(
      mask: 'CC #.###.###-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var fecha = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var code = new MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var telefono = new MaskTextInputFormatter(
      mask: '+## (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final mynombre = TextEditingController();
  final mycorreo = TextEditingController();
  final mytelefono = TextEditingController();
  final mytarjeta = TextEditingController();
  final myfecha = TextEditingController();
  final myclave = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        pateArriba(),
        const SizedBox(
          height: 20,
        ),
        input_date(),
        const SizedBox(
          height: 20,
        ),
        input_nombre(),
        const SizedBox(
          height: 20,
        ),
        input_correo(),
        const SizedBox(
          height: 20,
        ),
        input_telefono(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: input_cedula(),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: input_codigo(),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width - 30,
          child: ElevatedButton(
              onPressed: (() {
                boton();
              }),
              style: TextButton.styleFrom(
                primary: Colors.purpleAccent,
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Finalizar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purpleAccent,
                ),
              )),
        ),
      ]),
    );
  }

  Container pateArriba() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Formulario',
        style: TextStyle(
          fontSize: 38,
          color: Colors.purpleAccent,
        ),
      ),
    );
  }

  Future<dynamic> boton() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Text(
              'Fecha que se hizo el Formulario: ${myfecha.text}\n\n Nombre de la persona :  ${mynombre.text}\n\n El correo es: ${mycorreo.text}\n\n El telefono es: ${myclave.text}\n\n La cedula es: ${mytarjeta.text} / La fecha de expedicion es: ${myclave.text} ',
              style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 20,
                  color: Colors.purpleAccent)),
        );
      },
    );
  }

  Container input_nombre() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: mynombre,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Nombre'),
        ));
  }

  Container input_correo() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: mycorreo,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Correo'),
        ));
  }

  Container input_telefono() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: mytelefono,
          inputFormatters: [telefono],
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Telefono'),
        ));
  }

  Container input_cedula() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: mytarjeta,
          inputFormatters: [cardTarjeta],
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Cedula'),
        ));
  }

  Container input_date() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: myfecha,
          keyboardType: TextInputType.number,
          inputFormatters: [fecha],
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Fecha que se hace el formulario'),
        ));
  }

  Container input_codigo() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(7)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: myclave,
          keyboardType: TextInputType.number,
          inputFormatters: [fecha],
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Fecha de expedicion'),
        ));
  }
}
