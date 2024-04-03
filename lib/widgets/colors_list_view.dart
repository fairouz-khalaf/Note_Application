import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/cubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xFFA34343),
    Color(0xFFE9C874),
    Color(0xFFFBF8DD),
    Color(0xFFC0D6E8),
    Color(0xFFD862BC),
    Color(0xFF704264),
    Color(0xFF453F78),
    Color(0xFFD20062),
    Color(0xFF6AD4DD),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;

              BlocProvider.of<AddNotesCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorItem(
              color: colors[index],
              isActive: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
