import 'package:bunch_of_tasks/second/bloc/search_bloc.dart';
import 'package:bunch_of_tasks/second/bloc/search_event.dart';
import 'package:bunch_of_tasks/second/bloc/search_state.dart';
import 'package:bunch_of_tasks/second/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(),
      child: const NameListView(),
    );
  }
}

class NameListView extends StatefulWidget {
  const NameListView({super.key});

  @override
  State<NameListView> createState() => _NameListViewState();
}

class _NameListViewState extends State<NameListView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context.read<SearchBloc>().add(QueryChanged(_controller.text));
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) => ListView.builder(
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: state.result.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(state.result[i].name),
                    subtitle: Text(state.result[i].meaning),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                child: CustomEditText(controller: _controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
