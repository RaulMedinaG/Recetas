import 'package:http/http.dart';
import 'package:recetas/models/receta_model.dart';
import 'package:recetas/models/recetas_response_model.dart';

class RecetaProvider {
  List<Receta> recetas = [];
  final _url =
      "https://api.spoonacular.com/recipes/complexSearch?apiKey=ebcb43896024486688b4094f2a27f5ed&cuisine=";

  Future<List<Receta>> getRecetas(String tipoCocina) async {
    final url = _url + tipoCocina;

    Response response = await get(Uri.parse(url));

    final recetasResponse = recetasResponseFromJson(response.body);

    for(int i = 0; i < 3; i++){
      recetas.add(recetasResponse.recetas[i]);
    }

    return recetas;
  }
}
