import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frosty/core/settings/settings_store.dart';
import 'package:frosty/widgets/section_header.dart';

class ChatSettings extends StatelessWidget {
  final SettingsStore settingsStore;

  const ChatSettings({Key? key, required this.settingsStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader('Chat'),
            SwitchListTile.adaptive(
              isThreeLine: true,
              title: const Text('Hide banned and deleted messages'),
              subtitle: const Text('Replaces deleted, timed-out, and banned user messages with "<message deleted>".'),
              value: settingsStore.hideBannedMessages,
              onChanged: (newValue) => settingsStore.hideBannedMessages = newValue,
            ),
            SwitchListTile.adaptive(
              isThreeLine: true,
              title: const Text('Show zero-width emotes'),
              subtitle: const Text('Makes "stacked" emotes from BetterTTV and 7TV visible in chat messages.'),
              value: settingsStore.showZeroWidth,
              onChanged: (newValue) => settingsStore.showZeroWidth = newValue,
            ),
            SwitchListTile.adaptive(
              isThreeLine: true,
              title: const Text('Show timestamps'),
              subtitle: const Text('Displays 24-hour timestamps for when a chat message was sent.'),
              value: settingsStore.showTimestamps,
              onChanged: (newValue) => settingsStore.showTimestamps = newValue,
            ),
            SwitchListTile.adaptive(
              title: const Text('Use 12-hour timestamps'),
              value: settingsStore.useTwelveHourTimestamps,
              onChanged: settingsStore.showTimestamps ? (newValue) => settingsStore.useTwelveHourTimestamps = newValue : null,
            ),
          ],
        );
      },
    );
  }
}