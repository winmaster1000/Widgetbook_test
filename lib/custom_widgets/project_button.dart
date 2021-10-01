import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as time_ago;
import 'package:widgetbook_test/theme/colors.dart';

class ProjectButton extends StatelessWidget {
  const ProjectButton({
    Key? key,
    required this.projectName,
    this.projectImage,
    this.membersCount = 0,
    this.isSelected = false,
    required this.onPressed,
    this.updateTime,
    this.updateMember,
  }) : super(key: key);

  final String projectName;
  final String? projectImage;
  final int membersCount;
  final String? updateTime;
  final String? updateMember;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final memberText = membersCount == 1 ? '$membersCount member' : '$membersCount members';
    final widthFactor = MediaQuery.of(context).size.width / 30;
    final cardColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.intersection({
              MaterialState.pressed,
              MaterialState.focused,
              MaterialState.hovered,
            }).isNotEmpty ||
            isSelected) {
          return Colors.white;
        } else {
          return CustomColors.grey;
        }
      },
    );

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration:
              BoxDecoration(color: CustomColors.grey, borderRadius: BorderRadius.circular(16)),
        ),
        SizedBox(
          height: 100,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: cardColor,
              elevation: MaterialStateProperty.all(0),
            ),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(widthFactor / 3),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(projectImage ?? ''),
                  minRadius: 16.0,
                  maxRadius: 32.0,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      projectName,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: widthFactor / 10),
                    Text(
                      memberText,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        if (updateTime != null && updateMember != null)
          Positioned(
            bottom: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'updated: ${_formatUpdateTime(updateTime!)} by $updateMember',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
      ],
    );
  }

  String _formatUpdateTime(String updateTime) {
    return time_ago.format(DateTime.parse(updateTime));
  }
}
