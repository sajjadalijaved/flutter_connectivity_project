import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_f56/bloc/conectivity_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ConectivityBloc conectivityBloc =
        Provider.of<ConectivityBloc>(context, listen: false);
    return Scaffold(
      body: BlocBuilder<ConectivityBloc, ConectivityState>(
        bloc: conectivityBloc,
        builder: (context, state) {
          if (state is ConnectedState) {
            return Container(
              height: 200,
              color: Colors.blue,
            );
          } else {
            return Container(
              height: 200,
              color: Colors.red,
            );
          }
        },
      ),
    );
  }

  Widget initialUI() {
    return const Center(
      child: Text('Click To Load Data'),
    );
  }

  Widget loadingUI() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // Widget loadedUI(List<Album> albums) {
  //   return ListView.builder(
  //       itemCount: albums.length,
  //       itemBuilder: (context, index) => ListTile(
  //             leading: CircleAvatar(child: Text(albums[index].id.toString())),
  //             title: Text(albums[index].title),
  //           ));
  // }

  Widget errorUi(String message) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text(
        message,
        style: Theme.of(context).textTheme.headline3,
      )),
    );
  }
}
