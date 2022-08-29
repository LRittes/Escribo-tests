import 'package:app_movies/src/modules/home/data/datasource/interface/character_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/interface/movie_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/interface/user_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/local/sqflite/user_datasource_imp.dart';
import 'package:app_movies/src/modules/home/data/datasource/remoto/api/character_datasource_imp.dart';
import 'package:app_movies/src/modules/home/data/datasource/remoto/api/movie_datasource_imp.dart';
import 'package:app_movies/src/modules/home/data/datasource/services/implementations/dio.dart';
import 'package:app_movies/src/modules/home/data/datasource/services/interface/service.dart';
import 'package:app_movies/src/modules/home/data/repositories/character_repository_imp.dart';
import 'package:app_movies/src/modules/home/data/repositories/movie_repository_imp.dart';
import 'package:app_movies/src/modules/home/data/repositories/user_repository_imp.dart';
import 'package:app_movies/src/modules/home/domain/repositories/character_repository.dart';
import 'package:app_movies/src/modules/home/domain/repositories/movies_repository.dart';
import 'package:app_movies/src/modules/home/domain/repositories/user_repository.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_character.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_character/get_characters_imp.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_movies.dart/get_movies_imp.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user.dart';
import 'package:app_movies/src/modules/home/domain/usecases/get_user/get_user_imp.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user.dart';
import 'package:app_movies/src/modules/home/domain/usecases/save_user/save_user_imp.dart';
import 'package:app_movies/src/modules/home/presenters/views/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // services
        Bind.singleton<Service>((i) => DioServiceImp()),

        // datasources
        Bind.factory<UserDatasource>((i) => UserDatasourceImp()),
        Bind.factory<CharactersDatasource>((i) => CharactersDatasourceImp(i())),
        Bind.factory<MoviesDatasource>((i) => MoviesDatasourceImp(i())),

        // repositories
        Bind.factory<UserRepository>((i) => UserRepositoryImp(i())),
        Bind.factory<MoviesRepository>((i) => MoviesRepositoryImp(i())),
        Bind.factory<CharactersRepository>((i) => CharactersRepositoryImp(i())),

        // usecases
        Bind.factory<GetUser>((i) => GetUserImp(i())),
        Bind.factory<SaveUser>((i) => SaveUserImp(i())),
        Bind.factory<GetMovies>((i) => GetMoviesImp(i())),
        Bind.factory<GetCharacters>((i) => GetCharactersImp(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
