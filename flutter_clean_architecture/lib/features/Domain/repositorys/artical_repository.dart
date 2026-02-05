import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/Domain/entites/artical.dart';

abstract class ArticalRepository { 
  Future<DataState<List<ArticalEntities>>> getNewsArticals();
}