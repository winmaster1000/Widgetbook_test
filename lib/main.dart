import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_test/custom_widgets/project_button.dart';
import 'package:widgetbook_test/custom_widgets/rounded_button.dart';
import 'package:widgetbook_test/theme/theme.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Text('hello world'),
    );
  }
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customDevice1 = Device(
      name: 'Custom Device 1',
      resolution: Resolution.dimensions(
        width: 500,
        height: 500,
        scaleFactor: 2,
      ),
      type: DeviceType.desktop,
    );
    var customDevice2 = Device(
      name: 'Custom Device 2',
      resolution: Resolution.dimensions(
        width: 800,
        height: 600,
        scaleFactor: 2,
      ),
      type: DeviceType.tablet,
    );

    return Widgetbook(
      devices: [
        Apple.iPhone11,
        Apple.iPhone12,
        Apple.iPhone12mini,
        Apple.iPhone12pro,
        Samsung.s10,
        Samsung.s21ultra,
        customDevice1,
        customDevice2,
      ],
      darkTheme: AppTheme.dark,
      lightTheme: AppTheme.light,
      categories: [
        Category(
          name: 'widgets',
          widgets: [
            WidgetElement(
              name: '$CustomWidget',
              stories: [
                Story(
                  name: 'Default',
                  builder: (context) => const CustomWidget(),
                ),
              ],
            ),
          ],
          folders: [
            Folder(
              name: 'Texts',
              widgets: [
                WidgetElement(
                  name: 'Normal Text',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => const Text(
                        'The brown fox ...',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Folder(
              name: "Daily Status App",
              widgets: [
                WidgetElement(
                  name: "Project button",
                  stories: [
                    Story(
                      name: "Project button blah blah blah..",
                      builder: (context) => SizedBox(
                        height: 150.0,
                        child: ProjectButton(
                          projectName: "projectName",
                          membersCount: 10,
                          updateMember: 'Chicken Chicken',
                          updateTime: DateTime.now().subtract(const Duration(days: 1)).toString(),
                          projectImage:
                              'https://cdn0.iconfinder.com/data/icons/unigrid-flat-nature/90/009_058_animal_unicorn_horse_magic_fable_myth_virgin-512.png',
                          onPressed: () => {},
                        ),
                      ),
                    ),
                  ],
                ),
                WidgetElement(
                  name: "Buttons",
                  stories: [
                    Story(
                      name: "Button confirm",
                      builder: (context) => RoundedButton.confirm(),
                    ),
                    Story(
                      name: "Button add primary",
                      builder: (context) => RoundedButton.addPrimary(),
                    ),
                    Story(
                      name: "Button close",
                      builder: (context) => RoundedButton.close(),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ],
      appInfo: AppInfo(
        name: 'Widgetbook Example',
      ),
    );
  }
}

void main() {
  runApp(const HotReload());
}
