import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frosty/api/bttv_api.dart';
import 'package:frosty/api/ffz_api.dart';
import 'package:frosty/api/seventv_api.dart';
import 'package:frosty/api/twitch_api.dart';
import 'package:frosty/constants/constants.dart';
import 'package:frosty/core/auth/auth_store.dart';
import 'package:frosty/main.dart';
import 'package:frosty/screens/channel/chat/chat.dart';
import 'package:frosty/screens/channel/stores/chat_assets_store.dart';
import 'package:frosty/screens/channel/stores/chat_details_store.dart';
import 'package:frosty/screens/channel/stores/chat_store.dart';
import 'package:frosty/screens/channel/stores/video_store.dart';
import 'package:frosty/screens/settings/settings.dart';
import 'package:frosty/screens/settings/stores/settings_store.dart';
import 'package:frosty/widgets/profile_picture.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Creates a widget that shows the video stream (if live) and chat of the given user.
class VideoChat extends StatefulWidget {
  final String userId;
  final String userName;
  final String userLogin;

  const VideoChat({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userLogin,
  }) : super(key: key);

  @override
  State<VideoChat> createState() => _VideoChatState();
}

class _VideoChatState extends State<VideoChat> {
  final _videoKey = GlobalKey();
  final _chatKey = GlobalKey();

  late final ChatStore _chatStore = ChatStore(
    channelName: widget.userLogin,
    channelId: widget.userId,
    displayName: widget.userName,
    auth: context.read<AuthStore>(),
    settings: context.read<SettingsStore>(),
    chatDetailsStore: ChatDetailsStore(
      twitchApi: context.read<TwitchApi>(),
    ),
    assetsStore: ChatAssetsStore(
      twitchApi: context.read<TwitchApi>(),
      ffzApi: context.read<FFZApi>(),
      bttvApi: context.read<BTTVApi>(),
      sevenTVApi: context.read<SevenTVApi>(),
    ),
  );

  late final VideoStore _videoStore = VideoStore(
    userLogin: widget.userLogin,
    twitchApi: context.read<TwitchApi>(),
    authStore: context.read<AuthStore>(),
    settingsStore: context.read<SettingsStore>(),
  );

  @override
  Widget build(BuildContext context) {
    final settingsStore = _chatStore.settings;

    final player = Video(
      key: _videoKey,
      videoStore: _videoStore,
    );

    final overlay = VideoOverlay(videoStore: _videoStore);

    final video = GestureDetector(
      onLongPress: _videoStore.handleToggleOverlay,
      onTap: () {
        if (_chatStore.assetsStore.showEmoteMenu) {
          _chatStore.assetsStore.showEmoteMenu = false;
        } else {
          if (_chatStore.textFieldFocusNode.hasFocus) {
            _chatStore.textFieldFocusNode.unfocus();
          } else {
            _videoStore.handleVideoTap();
          }
        }
      },
      child: Observer(
        builder: (context) {
          if (_videoStore.settingsStore.showOverlay) {
            return Stack(
              children: [
                player,
                if (_videoStore.paused || _videoStore.streamInfo == null)
                  overlay
                else
                  AnimatedOpacity(
                    opacity: _videoStore.overlayVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: ColoredBox(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      child: IgnorePointer(
                        ignoring: !_videoStore.overlayVisible,
                        child: overlay,
                      ),
                    ),
                  ),
              ],
            );
          }
          return player;
        },
      ),
    );

    final chat = Chat(
      key: _chatKey,
      chatStore: _chatStore,
    );

    final appBar = AppBar(
      title: Text(
        regexEnglish.hasMatch(_chatStore.displayName) ? _chatStore.displayName : '${_chatStore.displayName} (${_chatStore.channelName})',
        style: const TextStyle(fontSize: 20),
      ),
      actions: [
        IconButton(
          tooltip: 'Settings',
          icon: const Icon(Icons.settings),
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Settings(settingsStore: settingsStore),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Scroll to bottom when summoning keyboard or rotating.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_chatStore.scrollController.hasClients) _chatStore.scrollController.jumpTo(_chatStore.scrollController.position.maxScrollExtent);
          });

          if (orientation == Orientation.landscape) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

            return Observer(
              builder: (context) {
                final landscapeChat = AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _chatStore.expandChat
                      ? MediaQuery.of(context).size.width / 2
                      : MediaQuery.of(context).size.width * _chatStore.settings.landscapeChatWidth,
                  curve: Curves.ease,
                  color: _chatStore.settings.fullScreen ? null : Theme.of(context).scaffoldBackgroundColor,
                  child: chat,
                );

                return ColoredBox(
                  color: settingsStore.showVideo ? Colors.black : Theme.of(context).scaffoldBackgroundColor,
                  child: SafeArea(
                    bottom: false,
                    child: settingsStore.showVideo
                        ? settingsStore.fullScreen
                            ? Stack(
                                alignment: settingsStore.landscapeChatLeftSide ? Alignment.topLeft : Alignment.topRight,
                                children: [
                                  video,
                                  IgnorePointer(
                                    ignoring: _videoStore.overlayVisible,
                                    child: Visibility(
                                      visible: settingsStore.fullScreenChatOverlay,
                                      maintainState: true,
                                      child: DefaultTextStyle(
                                        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.white),
                                        child: landscapeChat,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: settingsStore.landscapeChatLeftSide
                                    ? [
                                        landscapeChat,
                                        Expanded(child: video),
                                      ]
                                    : [
                                        Expanded(child: video),
                                        landscapeChat,
                                      ],
                              )
                        : Column(
                            children: [
                              appBar,
                              Expanded(child: chat),
                            ],
                          ),
                  ),
                );
              },
            );
          }

          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: SystemUiOverlay.values,
          );
          return SafeArea(
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    if (settingsStore.showVideo) {
                      return AspectRatio(
                        aspectRatio: 16 / 9,
                        child: video,
                      );
                    }
                    return appBar;
                  },
                ),
                Expanded(child: chat),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _chatStore.dispose();

    _videoStore.cancelSleepTimer();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    super.dispose();
  }
}

/// Creates a [WebView] widget that shows a channel's video stream.
class Video extends StatelessWidget {
  final VideoStore videoStore;

  const Video({
    Key? key,
    required this.videoStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      backgroundColor: Colors.black,
      initialUrl: videoStore.videoUrl,
      javascriptMode: JavascriptMode.unrestricted,
      allowsInlineMediaPlayback: true,
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      onWebViewCreated: (controller) => videoStore.controller = controller,
      onPageFinished: (string) => videoStore.initVideo(),
      navigationDelegate: videoStore.handleNavigation,
      javascriptChannels: videoStore.javascriptChannels,
    );
  }
}

/// Creates a widget containing controls which enable interactions with an underlying [Video] widget.
class VideoOverlay extends StatelessWidget {
  final VideoStore videoStore;

  const VideoOverlay({Key? key, required this.videoStore}) : super(key: key);

  Future<void> _showSleepTimerDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sleep Timer'),
        content: Observer(
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  DropdownButton(
                    value: videoStore.sleepHours,
                    items: List.generate(24, (index) => index).map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
                    onChanged: (int? hours) => videoStore.sleepHours = hours!,
                    menuMaxHeight: 200,
                  ),
                  const SizedBox(width: 10.0),
                  const Text('Hours'),
                ],
              ),
              Row(
                children: [
                  DropdownButton(
                    value: videoStore.sleepMinutes,
                    items: List.generate(60, (index) => index).map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
                    onChanged: (int? minutes) => videoStore.sleepMinutes = minutes!,
                    menuMaxHeight: 200,
                  ),
                  const SizedBox(width: 10.0),
                  const Text('Minutes'),
                ],
              ),
              if (videoStore.sleepTimer != null && videoStore.sleepTimer!.isActive)
                Row(
                  children: [
                    const Icon(Icons.timer),
                    Text(' ${videoStore.timeRemaining.toString().split('.')[0]}'),
                    const Spacer(),
                    IconButton(
                      tooltip: 'Cancel Timer',
                      onPressed: videoStore.cancelSleepTimer,
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            style: TextButton.styleFrom(primary: Colors.red),
            child: const Text('Dismiss'),
          ),
          Observer(
            builder: (context) => ElevatedButton(
              onPressed: videoStore.sleepHours == 0 && videoStore.sleepMinutes == 0
                  ? null
                  : () => videoStore.updateSleepTimer(
                        onTimerFinished: () => navigatorKey.currentState?.popUntil((route) => route.isFirst),
                      ),
              child: const Text('Set Timer'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    final backButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        tooltip: 'Back',
        icon: Icon(
          Icons.adaptive.arrow_back,
          color: Colors.white,
        ),
        onPressed: Navigator.of(context).pop,
      ),
    );

    final settingsButton = IconButton(
      tooltip: 'Settings',
      icon: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
      onPressed: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Settings(settingsStore: videoStore.settingsStore),
        ),
      ),
    );

    final chatOverlayButton = IconButton(
      tooltip: 'Toggle Chat Overlay',
      onPressed: () => videoStore.settingsStore.fullScreenChatOverlay = !videoStore.settingsStore.fullScreenChatOverlay,
      icon: const Icon(Icons.chat_bubble_outline),
      color: Colors.white,
    );

    final refreshButton = IconButton(
      tooltip: 'Refresh',
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      onPressed: videoStore.handleRefresh,
    );

    final fullScreenButton = IconButton(
      tooltip: videoStore.settingsStore.fullScreen ? 'Exit Fullscreen' : 'Enter Fullscreen',
      icon: videoStore.settingsStore.fullScreen
          ? const Icon(
              Icons.fullscreen_exit,
              color: Colors.white,
            )
          : const Icon(
              Icons.fullscreen,
              color: Colors.white,
            ),
      onPressed: () => videoStore.settingsStore.fullScreen = !videoStore.settingsStore.fullScreen,
    );

    final sleepTimerButton = IconButton(
      tooltip: 'Sleep Timer',
      icon: const Icon(
        Icons.timer,
        color: Colors.white,
      ),
      onPressed: () => _showSleepTimerDialog(context),
    );

    final streamInfo = videoStore.streamInfo;
    if (streamInfo == null) {
      return Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton,
              const Spacer(),
              settingsButton,
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (videoStore.settingsStore.fullScreen && orientation == Orientation.landscape) chatOverlayButton,
                refreshButton,
                if (orientation == Orientation.landscape) fullScreenButton,
              ],
            ),
          ),
        ],
      );
    }

    final streamerName = regexEnglish.hasMatch(streamInfo.userName) ? streamInfo.userName : '${streamInfo.userName} (${streamInfo.userLogin})';
    final streamer = Row(
      children: [
        ProfilePicture(
          userLogin: streamInfo.userLogin,
          radius: 10.0,
        ),
        const SizedBox(width: 5.0),
        Flexible(
          child: Tooltip(
            message: streamerName,
            preferBelow: false,
            child: Text(
              streamerName,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );

    return Observer(
      builder: (context) {
        return Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton,
                const Spacer(),
                sleepTimerButton,
                settingsButton,
              ],
            ),

            // Add a play button when paused for Android
            // When an ad is paused on Android there is no way to unpause, so a play button is necessary.
            if (Platform.isAndroid)
              Center(
                child: IconButton(
                  tooltip: videoStore.paused ? 'Play' : 'Pause',
                  iconSize: 50.0,
                  icon: videoStore.paused
                      ? const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                  onPressed: videoStore.handlePausePlay,
                ),
              )
            else if (!videoStore.paused)
              Center(
                child: IconButton(
                  tooltip: 'Pause',
                  iconSize: 50.0,
                  icon: const Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                  onPressed: videoStore.handlePausePlay,
                ),
              ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: videoStore.handleExpand,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: videoStore.settingsStore.expandInfo
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  streamer,
                                  const SizedBox(height: 5.0),
                                  Tooltip(
                                    message: videoStore.streamInfo!.title.trim(),
                                    preferBelow: false,
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      videoStore.streamInfo!.title.trim(),
                                      maxLines: orientation == Orientation.portrait ? 1 : 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    '${videoStore.streamInfo?.gameName} \u2022 ${NumberFormat().format(videoStore.streamInfo?.viewerCount)} viewers',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : streamer,
                      ),
                    ),
                  ),
                  if (Platform.isIOS && videoStore.settingsStore.pictureInPicture)
                    IconButton(
                      tooltip: 'Picture-in-Picture',
                      icon: const Icon(
                        Icons.picture_in_picture_alt_rounded,
                        color: Colors.white,
                      ),
                      onPressed: videoStore.requestPictureInPicture,
                    ),
                  if (videoStore.settingsStore.fullScreen && orientation == Orientation.landscape) chatOverlayButton,
                  refreshButton,
                  if (orientation == Orientation.landscape) fullScreenButton
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
