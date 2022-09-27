
import 'package:dio/dio.dart';
import 'package:harryapp/fecth/character_fetch.dart';
import 'package:harryapp/models/character_models.dart';
import 'package:harryapp/screens/constants.dart';

class RemoteServices {
  static var dio = Dio ();

  static Future<List<CharacterModel>> fetchCharacter () async {
    var response = await dio.get(baseUrl);  //////ESTO VIENE DE LA CARPETA DE SCREENS - CONSTANTS
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => CharacterModel.fromJson(item)).toList();
    } else {
      throw Exception('Fallo en la carga de informacion  revise el codigo');
    } 
  }
}