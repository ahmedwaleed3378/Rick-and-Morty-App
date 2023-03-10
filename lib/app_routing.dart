import 'package:bb/presentation_layer/screens/splash_screen.dart';

import 'Business_Logic_Layer/cubit/charcters_cubit.dart';
import 'Data_layer/modles/Character.dart';
import 'Data_layer/web_services/characters_web_services.dart';
import 'constants/constants.dart';
import 'presentation_layer/screens/characters_details_screen.dart';
import 'presentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data_layer/repository/characters_repository.dart';

class AppRouting {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouting() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) =>
             const SplashScreen(),
        );
      case allCharactersRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case charactersDetails:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(charactersRepository),
                  child: CharacterDetailsScreen(character: character),
                ));
    }
  }
}
