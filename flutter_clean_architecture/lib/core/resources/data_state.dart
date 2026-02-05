abstract class DataState<T> { 
  final T? data;
  final DioError? error;

  DataState(this.data, this.error);
  
}