class RoutesNames {
  static String get appInit => '/';
  static String get connectionError => '/connection-error';
  static final CharactersRoutes characters = CharactersRoutes();
}

class CharactersRoutes {
  String get charactersList => '/characters-list';
  String get baseCharacterDetails => '/character-details';

  String characterDetails(String id) => '$baseCharacterDetails?id=$id';
}
