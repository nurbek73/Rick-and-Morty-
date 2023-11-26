import 'package:flutter/material.dart';
import 'package:riick_and_morty/data/models/character_model.dart';
import 'package:riick_and_morty/presentation/screens/Chararacters_detal.dart';
import 'package:riick_and_morty/presentation/theme/app_fonts.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.dataResults,
    required this.scrollController,
  });

  final List<CharacterResults> dataResults;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisSpacing: 4,
          mainAxisSpacing: 1,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterDetails(
                      data: dataResults[index],
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 61,
                foregroundImage: NetworkImage(
                  dataResults[index].image ?? '',
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              dataResults[index].status?.toUpperCase() ?? '',
              style: AppFonts.s10w500.copyWith(
                color: getColor(
                  dataResults[index].status ?? '',
                ),
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                dataResults[index].name ?? '',
                style: AppFonts.s16w500w,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${dataResults[index].species}, ${dataResults[index].gender}',
              style: AppFonts.s12w400,
            ),
          ],
        ),
        itemCount: dataResults.length,
      ),
    );
  }

  Color getColor(String status) {
    if (status == "Alive") {
      return Colors.green;
    } else if (status == 'unknown') {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}
