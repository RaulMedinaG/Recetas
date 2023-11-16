import 'package:flutter/material.dart';
import 'package:recetas/models/receta_model.dart';
import 'package:recetas/providers/recetas_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Receta> italiana = [];
  List<Receta> americana = [];
  List<Receta> mediterranea = [];

  int comidaSeleccionada = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Elige un tipo de comida',
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: const Text("Comida Italiana"),
                onTap: () async {
                  if (italiana.isEmpty) {
                    italiana = await RecetaProvider().getRecetas("italian");
                  }
                  comidaSeleccionada = 0;

                  setState(() {});
                },
              ),
              GestureDetector(
                child: const Text("Comida mediterranea"),
                onTap: () async {
                  if (mediterranea.isEmpty) {
                    mediterranea =
                        await RecetaProvider().getRecetas("mediterranean");
                  }
                  comidaSeleccionada = 1;
                  setState(() {});
                },
              ),
              GestureDetector(
                child: const Text("Comida Americana"),
                onTap: () async {
                  if (americana.isEmpty) {
                    americana = await RecetaProvider().getRecetas("american");
                  }
                  comidaSeleccionada = 2;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 570,
          child: InfoRecetas(
            comidaSeleccionada: comidaSeleccionada,
            italiana: italiana,
            mediterranea: mediterranea,
            americana: americana,
          ),
        ),
      ]),
    );
  }
}

class InfoRecetas extends StatelessWidget {
  int comidaSeleccionada = -1;
  List<Receta> italiana = [];
  List<Receta> mediterranea = [];
  List<Receta> americana = [];

  InfoRecetas({
    required this.comidaSeleccionada,
    required this.italiana,
    required this.mediterranea,
    required this.americana,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: comidaSeleccionada == -1
          ? const Text("Aún no hay datos, selecciona una comida")
          : comidaSeleccionada == 0
              ? PintaReceta(recetas: italiana)
              : comidaSeleccionada == 1
                  ? PintaReceta(recetas: mediterranea)
                  : PintaReceta(recetas: americana),
      // color: Colors.red,
    );
  }
}

class PintaReceta extends StatelessWidget {
  const PintaReceta({
    super.key,
    required this.recetas,
  });

  final List<Receta> recetas;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
        for (var receta in recetas)
          Container(
            child: Column(children: [
              Text(receta.title),
              SizedBox(
                width: 200,
                height: 100,
                child: Image.network(receta.image),
              ),
            ]),
            margin: const EdgeInsets.all(10),
            height: 150,
            width: 300,
          )
      ],
      
      );
  }
}
