import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DialogShowImage extends StatefulWidget {
  final int? tagIndex;
  final List<String>? images;

  const DialogShowImage({
    Key? key,
    this.tagIndex,
    this.images,
  }) : super(key: key);

  @override
  _DialogShowImageState createState() => _DialogShowImageState();
}

class _DialogShowImageState extends State<DialogShowImage> {
  String tokenImage = '';

  int tagIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    tagIndex = widget.tagIndex ?? 0;
    _pageController = PageController(initialPage: tagIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Hero(
                      tag: tagIndex,
                      child: _imageView(widget.images![index]),
                    ),
                  );
                },
                onPageChanged: (indexPage) {
                  tagIndex = indexPage;
                  setState(() {});
                },
                itemCount: widget.images?.length ?? 0,
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SizedBox(
                    height: 60,
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: 4.0,
                      ),
                      itemBuilder: (_, index) {
                        if (widget.images == null || widget.images!.isEmpty)
                          return const SizedBox.shrink();
                        return GestureDetector(
                          onTap: () {
                            tagIndex = index;
                            setState(() {});
                            _pageController.jumpToPage(tagIndex);
                          },
                          child: SizedBox(
                            width: 100.0,
                            height: 59.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF2F3F4),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      child: _imageView(widget.images![index]),
                                    ),
                                    Visibility(
                                      visible: tagIndex != index,
                                      child: Container(
                                        width: 100.0,
                                        height: 60.0,
                                        color: Color(0x80011222),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: widget.images!.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageView(String pathImage) {
    if (pathImage.isURL()) {
      return Image.network(
        pathImage,
        fit: BoxFit.contain,
      );
    }
    if (pathImage.isFileExist()) {
      return Image.file(
        File(pathImage),
        fit: BoxFit.contain,
      );
    }
    return CachedNetworkImage(
      imageUrl:pathImage,
    );
  }

}
extension StringExtension on String{
  bool isURL() {
    return startsWith('http://') || startsWith('https://');
  }
  bool isFileExist() {
    return File(this).existsSync();
  }
}

