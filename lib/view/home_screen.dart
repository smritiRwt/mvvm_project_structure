import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_app/data/response/status.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/view_model/home_view_model.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final userPreference = Provider.of<UserViewModel>
    (context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            "Home Screen",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () async {
                  final isRemoved = await userPreference.removeUser();

                  if (isRemoved) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.login,
                      (route) => false,
                    );
                  }
                },
                child: const Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),

        body: Consumer<HomeViewModel>(
          builder: (context, value, child) {

            switch (value.postList.status) {

              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case Status.ERROR:
                return Center(
                  child: Text(
                    value.postList.message ?? "Something went wrong",
                  ),
                );

              case Status.COMPLETED:

                final posts = value.postList.data;

                if (posts == null || posts.isEmpty) {
                  return const Center(
                    child: Text("No posts available"),
                  );
                }

                return ListView.builder(
                  itemCount: posts!.length,
                  itemBuilder: (context, index) {

                    final post = posts[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: ListTile(
                        title: Text(
                          post.title ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(post.body ?? ''),
                      ),
                    );
                  },
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}