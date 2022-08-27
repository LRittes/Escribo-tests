class UserException {
  final String message;
  final StackTrace? stackTrace;

  UserException(this.message, [this.stackTrace]);
}

class CharacterException {
  final String message;
  final StackTrace? stackTrace;

  CharacterException(this.message, [this.stackTrace]);
}

class MovieException {
  final String message;
  final StackTrace? stackTrace;

  MovieException(this.message, [this.stackTrace]);
}
