import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riick_and_morty/bloc/characters_bloc.dart';
import 'package:riick_and_morty/presentation/screens/widgets/TextField_widget.dart';
import 'package:riick_and_morty/presentation/screens/widgets/characters_vsego.dart';
import 'package:riick_and_morty/presentation/screens/widgets/gridView_witget.dart';
import 'package:riick_and_morty/presentation/screens/widgets/listView_widget.dart';
import 'package:riick_and_morty/presentation/theme/app_fonts.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  bool isList = true;
  TextEditingController controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    BlocProvider.of<CharactersBloc>(context).add(
      GetCharactersDataEvent(),
    );
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage <= 42) {
          currentPage++;
          BlocProvider.of<CharactersBloc>(context).add(
            GetCharactersDataEvent(page: currentPage.toString()),
          );
        }
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        if (currentPage > 0) {
          currentPage--;
          BlocProvider.of<CharactersBloc>(context).add(
            GetCharactersDataEvent(page: currentPage.toString()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFieldWidget(
          controller: controller,
          hintText: 'Найти персонажа',
          onSearch: () {
            BlocProvider.of<CharactersBloc>(context).add(
              GetCharactersDataEvent(
                name: controller.text,
              ),
            );
          },
          onChanged: (value) {
            BlocProvider.of<CharactersBloc>(context).add(
              GetCharactersDataEvent(name: value),
            );
          },
          onFilter: () {},
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is CharactersSuccess) {
            return Column(
              children: [
                CharactersTotalWidget(
                  count: state.model.info?.count.toString() ?? '',
                  isList: isList,
                  onPressed: () {
                    isList = !isList;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 12),
                isList
                    ? ListViewWidget(
                        dataResults: state.model.results ?? [],
                        scrollController: _scrollController,
                      )
                    : GridViewWidget(
                        dataResults: state.model.results ?? [],
                        scrollController: _scrollController,
                      ),
              ],
            );
          } else if (state is CharactersError) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 29),
                  Text(
                    'Результаты поиска'.toUpperCase(),
                    style: AppFonts.s10w500c,
                  ),
                  const SizedBox(height: 70),
                  Image.asset(
                    'assets/images/error.png',
                    height: 250,
                    width: 150,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Персонаж с таким именем\nне найден',
                    style: AppFonts.s16w400,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
