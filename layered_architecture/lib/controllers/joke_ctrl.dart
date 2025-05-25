import 'package:layered_architecture/entities/joke_model.dart';
import 'package:layered_architecture/services/joke_services.dart';
import 'package:get/get.dart';

class JokeController extends GetxController {
  final JokeServices _jokeServices;

  //dependency injection
  JokeController(this._jokeServices);

  var joke = Rxn<JokeModel>(); // Using Rxn to allow null object
  var jokes = <JokeModel>[].obs; //using obs for a non null object
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJoke(); // Fetch a joke when the controller is initialized
  }

  Future<void> fetchJoke() async {
    try {
      isLoading.value = true;
      var data = await _jokeServices.getJoke();
      joke.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load jokes: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchJokes() async {
    //throw not implemented exception
    //Jokes.value = await _jokeServices.getJokes();
    throw UnimplementedError('fetchJokes method is not implemented yet');
  }
}
