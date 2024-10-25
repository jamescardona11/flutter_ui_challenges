import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/data/movies.json.dart';
import 'package:movies_app/details/widgets/mark_as_favorite_button.dart';
import 'package:movies_app/models/movie_entity.dart';
import 'package:movies_app/widgets/back_button_widget.dart';
import 'package:movies_app/widgets/rating_widget.dart';

import 'basic_card.dart';
import 'widgets/background_detail_page.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late int currentPage;
  final List<MovieEntity> movies = moviesJSON.map((e) => MovieEntity.fromJson(e)).toList();
  late final PageController controller;
  bool enabledAnimation = false;

  @override
  void initState() {
    super.initState();
    final index = movies.indexWhere((e) => e.id == widget.id);
    currentPage = index;
    controller = PageController(initialPage: index);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 800), () {
        enabledAnimation = true;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: _ShaderMaskTransition(
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (movies.isNotEmpty)
              BackgroundDetailPage(
                id: movies[currentPage].id.toString(),
                imageUrl: movies[currentPage].imageUrl,
              ),
            PageView.builder(
              controller: controller,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemCount: movies.length,
              itemBuilder: ((context, index) {
                final movie = movies[index];

                return _WidgetToAnimatedPageViewElements(
                  controller: controller,
                  index: index,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      SizedBox(
                        height: 350,
                        width: size.width * 0.65,
                        child: BasicCard(
                          id: movie.id.toString(),
                          imageUrl: movie.imageUrl,
                          enabledAnimation: enabledAnimation,
                        ),
                      ),
                      const Spacer(),
                      _MainSection(movie: movie),
                    ],
                  ),
                );
              }),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: BackButtonWidget(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WidgetToAnimatedPageViewElements extends StatelessWidget {
  const _WidgetToAnimatedPageViewElements({
    super.key,
    required this.controller,
    required this.index,
    required this.child,
  });

  final PageController controller;
  final int index;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page! - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
        }

        return Transform.scale(
          scale: Curves.easeOut.transform(value),
          child: Opacity(
            opacity: Curves.easeOut.transform(value),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _MainSection extends StatelessWidget {
  const _MainSection({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: 420,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            movie.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (movie.year != null) ...[
                const FaIcon(
                  FontAwesomeIcons.calendar,
                  size: 15,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Text(
                  movie.year!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
              const SizedBox(width: 10),
              const FaIcon(
                FontAwesomeIcons.language,
                size: 15,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(
                movie.language,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                (movie.genreIds.firstOrNull ?? '').toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                (movie.status ?? '').toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RatingWidget(
              rating: movie.rating.toStringAsFixed(2),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Text(
              movie.overview,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
            ),
          ),
          Expanded(
            child: MarkAsFavoriteButton(
              label: 'Save as Favorite',
              isFavorite: movie.isFavorite,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _ShaderMaskTransition extends StatelessWidget {
  const _ShaderMaskTransition({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(
        begin: 0.0,
        end: 1.0,
      ),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return ShaderMask(
            blendMode: BlendMode.modulate,
            shaderCallback: (rect) {
              return RadialGradient(
                radius: value * 5,
                colors: const [
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                  Colors.transparent,
                ],
                stops: const [
                  0.0,
                  0.5,
                  0.66,
                  1.0,
                ],
                center: const FractionalOffset(
                  0.95,
                  0.9,
                ),
              ).createShader(rect);
            },
            child: child);
      },
      child: child,
    );
  }
}
