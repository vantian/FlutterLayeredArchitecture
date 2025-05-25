import 'package:layered_architecture/entities/joke_model.dart';
import 'package:layered_architecture/repositories/joke_repo.dart';

class JokeServices {
  final JokeRepo _jokeRepo;

  //dependency injection
  JokeServices(this._jokeRepo);

  Future<JokeModel?> getJoke() async {
    //add wait thread just for fun
    await Future.delayed(Duration(seconds: 2));
    return await _jokeRepo.getJoke();
  }
}
