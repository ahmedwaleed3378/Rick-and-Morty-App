// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// import '../../Data_layer/modles/qoutes.dart';
// import '../../Data_layer/repository/characters_repository.dart';

// part 'qoutes_state.dart';

// class QoutesCubit extends Cubit<QoutesState> {
//   final CharactersRepository charactersRepository;

//   void getQoutes(String charName) {
//     charactersRepository.getQoutes(charName).then((qoutes) {
//       emit(QoutesLoaded(qoutes));
//     });
//   }

//   QoutesCubit(this.charactersRepository) : super(QoutesInitial());
// }
