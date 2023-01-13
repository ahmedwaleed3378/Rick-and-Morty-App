import '../modles/Character.dart';
import '../modles/qoutes.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository{
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  Future<List<Character>>getAllCharacters()async{
    final List characters=await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
  
  Future<List<Qoute>>getQoutes(String charName)async{
    final qoutes=await charactersWebServices.getQoutes(charName);
    return qoutes.map((qout) => Qoute.fromjson(qout)).toList();
  }

}