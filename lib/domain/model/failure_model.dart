abstract class FailureModel {

  final String message ;
  const FailureModel(this.message);
}
class ServerFailure extends FailureModel {
  const ServerFailure(String message):super(message);
}
class ConnectionFailure extends FailureModel {
  const ConnectionFailure(String message):super(message);
}

class DatabaseFailure extends FailureModel {
  const DatabaseFailure(String message):super(message);
}
class TokenExpire extends FailureModel {
  const TokenExpire(String message):super(message);
}