import 'dart:async';

import 'package:boilerplate/data/local/datasources/post/post_datasource.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/models/post/post_list.dart';

import 'network/apis/posts/post_api.dart';

class Repository {
  // database object
  final _postDataSource = PostDataSource.instance;

  // api objects
  final _postApi = PostApi();

  // shared pref object
  final _sharedPrefsHelper = SharedPreferenceHelper();

  // singleton repository object
  static final Repository _repository = Repository._internal();

  // named private constructor
  Repository._internal();

  // factory method to return the same object each time its needed
  factory Repository() => _repository;

  // General Methods: ----------------------------------------------------------
  static Repository get() => _repository;

  // Post: ---------------------------------------------------------------------
  Future<PostsList> getPosts() => _postApi
      .getPosts()
      .then((posts) => posts)
      .catchError((error) => throw error);
}
