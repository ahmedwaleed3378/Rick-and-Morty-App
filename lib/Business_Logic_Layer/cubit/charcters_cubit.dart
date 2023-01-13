import '../../Data_layer/modles/qoutes.dart';
import '../../Data_layer/repository/characters_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data_layer/modles/Character.dart';

part 'charcters_state.dart';

// class CharactersCubit extends Cubit<CharactersState> {
//   List<Character> characters = [];
//   final CharactersRepository charactersRepository;
//   List<Character> getAllCharacters() {
//     charactersRepository.getAllCharacters().then((charaters) {
//       emit(CharactersLoaded(charaters));
//       this.characters = charaters;
//     });
//     return characters;
//   }

//  // List<Qoute> qoutes = [];
//   // void getQoutes(String charName) {
//   //   charactersRepository.getQoutes(charName).then((qoutes) {
//   //     emit(QoutesLoaded(qoutes));
//   //   });
//   // }

//   CharactersCubit(this.charactersRepository) : super(CharactersInitial());
// }


class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getQoutes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
  
}