// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_using_api/controllers/post_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostController _postController = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listando Dados API"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge(
                    [_postController.posts, _postController.isLoading]),
                builder: (_, __) => _postController.isLoading.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _postController.posts.value.length,
                        itemBuilder: (_, index) => Card(
                              elevation: 3,
                              child: ListTile(
                                title: Text(
                                  _postController.posts.value[index].title
                                      .toString(),
                                ),
                              ),
                            )),
              ),
              MaterialButton(
                color: Colors.deepPurple,
                onPressed: () {
                  _postController.callApi();
                },
                child: Text(
                  "Carregar Dados",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
