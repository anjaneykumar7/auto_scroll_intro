import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AutoScrollIntro extends StatefulWidget {
  final List<String> imageList;
  final String? title;
  final TextStyle titleStyle;
  final String? description;
  final TextStyle descriptionStyle;
  final String avatar;
  final double avatarSize;
  final double avatarBorderWidth;
  final Color avatarBorderColor;
  final Color backgroundColor;
  final VoidCallback onFinished;
  final Duration duration;

  const AutoScrollIntro({
    Key? key,
    required this.imageList,
    this.title,
    this.titleStyle = const TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    this.description,
    this.descriptionStyle = const TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    required this.avatar,
    this.avatarSize = 40,
    this.avatarBorderWidth = 2,
    this.avatarBorderColor = Colors.redAccent,
    this.backgroundColor = Colors.black,
    required this.onFinished,
    this.duration = const Duration(seconds: 5),
  }) : super(key: key);

  @override
  _AutoScrollIntroState createState() => _AutoScrollIntroState();
}

class _AutoScrollIntroState extends State<AutoScrollIntro> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        widget.onFinished();
      }
    });
    super.initState();
  }

  void _scrollToBottom() async {
    await Future.delayed(const Duration(seconds: 1));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: widget.duration,
// duration: Duration(seconds: widget.asset.length * 10),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: widget.backgroundColor,
              width: size.width,
              height: size.height,
              child: GridView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image(
                      image: AssetImage(widget.imageList[index]),
                      fit: BoxFit.cover,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: size.width / size.height,
                  )),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.backgroundColor.withOpacity(0),
                      widget.backgroundColor.withOpacity(0),
                      widget.backgroundColor.withOpacity(0),
                      widget.backgroundColor.withOpacity(0.9),
                      widget.backgroundColor.withOpacity(1),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeInUp(
                      delay: const Duration(milliseconds: 2000),
                      child: CircleAvatar(
                        backgroundColor: widget.avatarBorderColor,
                        radius: widget.avatarSize + widget.avatarBorderWidth,
                        child: CircleAvatar(
                          radius: widget.avatarSize,
                          backgroundImage: AssetImage(widget.avatar),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (widget.title != null)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1000),
                          child: Text(widget.title!,
                              textAlign: TextAlign.center,
                              style: widget.titleStyle),
                        ),
                      ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    if (widget.description != null) ...[
                      ZoomIn(
                        delay: const Duration(milliseconds: 1900),
                        child: Text(
                          widget.description!,
                          textAlign: TextAlign.center,
                          style: widget.descriptionStyle,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 100,
                      ),
                    ]
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
