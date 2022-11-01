import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ListItemSkeleton extends StatefulWidget {
  bool loading = false;

  ListItemSkeleton({
    this.loading = false,
    super.key,
  });

  @override
  State<ListItemSkeleton> createState() => _ListItemSkeletonState();
}

class _ListItemSkeletonState extends State<ListItemSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 1,
                spacing: 0,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 15,
                  borderRadius: BorderRadius.circular(4),
                  minLength: MediaQuery.of(context).size.width / 3,
                  maxLength: MediaQuery.of(context).size.width - 150,
                ),
              ),
            ),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 1,
                spacing: 0,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(4),
                  minLength: MediaQuery.of(context).size.width / 6,
                  maxLength: MediaQuery.of(context).size.width / 3,
                ),
              ),
            ),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 1,
                spacing: 0,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(4),
                  minLength: MediaQuery.of(context).size.width / 3,
                  maxLength: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ),
          ],
        ),
        const SkeletonAvatar(style: SkeletonAvatarStyle(width: 30, height: 30))
      ],
    );
  }
}
