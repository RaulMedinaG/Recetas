// To parse this JSON data, do
//
//     final recetasResponse = recetasResponseFromJson(jsonString);

import 'dart:convert';

import 'receta_model.dart';

RecetasResponse recetasResponseFromJson(String str) =>
    RecetasResponse.fromJson(json.decode(str));

class RecetasResponse {
  final List<Receta> recetas;

  RecetasResponse({
    required this.recetas,
  });

  factory RecetasResponse.fromJson(Map<String, dynamic> json) =>
      RecetasResponse(
        recetas:
            List<Receta>.from(json["results"].map((x) => Receta.fromJson(x))),
      );
}