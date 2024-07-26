abstract class Result<T>{
  T? data;
  bool get isSuccessful => this is Success<T>;
  Result(this.data);
}

class Success<T> extends Result<T> {
  Success(super.data);
}

class Failed<T> extends Result<T> {
  String? errorCode;
  String message;
  Failed(this.errorCode, this.message) : super(null);
}
