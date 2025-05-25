import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layered_architecture/controllers/joke_ctrl.dart';

class JokeShow extends StatelessWidget {
  final JokeController jokeCtrl = Get.find<JokeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jokes')),
      body: Obx(() {
        if (jokeCtrl.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (jokeCtrl.joke.value == null) {
          return Center(child: Text('No jokes found'));
        } else {
          return ListTile(
            title: Text(jokeCtrl.joke.value?.setup ?? "N/A"),
            subtitle: Text(jokeCtrl.joke.value!.punchline ?? "N/A"),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: jokeCtrl.fetchJoke,
        tooltip: 'Refresh Jokes',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
