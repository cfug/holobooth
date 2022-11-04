import 'package:flutter/material.dart';
import 'package:io_photobooth/assets/assets.dart';

class CharacterSelector extends StatefulWidget {
  @visibleForTesting
  const CharacterSelector({super.key, required this.viewportFraction});
  const CharacterSelector.small({Key? key})
      : this(
          viewportFraction: 0.55,
          key: key,
        );

  const CharacterSelector.medium({Key? key})
      : this(
          viewportFraction: 0.3,
          key: key,
        );

  const CharacterSelector.large({Key? key})
      : this(
          viewportFraction: 0.2,
          key: key,
        );

  const CharacterSelector.xLarge({Key? key})
      : this(
          viewportFraction: 0.2,
          key: key,
        );

  final double viewportFraction;

  @override
  State<CharacterSelector> createState() => CharacterSelectorState();
}

@visibleForTesting
class CharacterSelectorState extends State<CharacterSelector> {
  @visibleForTesting
  PageController? pageController;
  int _activePage = 0;

  static const dashKey = Key('characterSelector_dash');
  static const sparkyKey = Key('characterSelector_sparky');

  static final _characters = [
    Assets.characters.dash.image(),
    Assets.characters.sparky.image(),
  ];

  static const characterKeys = [dashKey, sparkyKey];

  void _initController() {
    if (pageController != null) {
      pageController!.dispose();
    }
    pageController = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: _activePage,
    );
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(covariant CharacterSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController?.dispose();
  }

  void _onTapCharacter(int index) {
    pageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: PageView.builder(
        itemCount: 2,
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            _activePage = value;
          });
        },
        itemBuilder: (context, index) {
          final isActive = index == _activePage;
          return InkWell(
            onTap: () => _onTapCharacter(index),
            key: characterKeys[index],
            child: _Character(isActive: isActive, image: _characters[index]),
          );
        },
      ),
    );
  }
}

class _Character extends StatelessWidget {
  const _Character({
    required this.isActive,
    required this.image,
  });

  final bool isActive;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isActive ? 1 : 0.70,
      duration: const Duration(milliseconds: 300),
      child: image,
    );
  }
}