import 'package:dio/dio.dart';
import 'package:riick_and_morty/data/models/character_model.dart';

class CharacterRepository {
  final Dio dio;

  CharacterRepository({required this.dio});

  Future<CharactersModel> getCharactersData({
    String? status,
    String? name,
    String? species,
    String? gender,
    String? page,
  }) async {
    final Response response = await dio
        .get('https://rickandmortyapi.com/api/character', queryParameters: {
      "name": name,
      "status": status,
      "species": species,
      "gender": gender,
      "page": page,
    });

    return CharactersModel.fromJson(response.data);
  }
}
