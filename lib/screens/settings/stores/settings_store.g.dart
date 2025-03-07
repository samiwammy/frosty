// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsStore _$SettingsStoreFromJson(Map<String, dynamic> json) =>
    SettingsStore()
      ..themeType = $enumDecodeNullable(_$ThemeTypeEnumMap, json['themeType'],
              unknownValue: ThemeType.system) ??
          ThemeType.system
      ..showThumbnailUptime = json['showThumbnailUptime'] as bool? ?? false
      ..showThumbnails = json['showThumbnails'] as bool? ?? true
      ..launchUrlExternal = json['launchUrlExternal'] as bool? ?? false
      ..showVideo = json['showVideo'] as bool? ?? true
      ..showOverlay = json['showOverlay'] as bool? ?? true
      ..toggleableOverlay = json['toggleableOverlay'] as bool? ?? false
      ..pictureInPicture = json['pictureInPicture'] as bool? ?? false
      ..overlayOpacity = (json['overlayOpacity'] as num?)?.toDouble() ?? 0.5
      ..showBottomBar = json['showBottomBar'] as bool? ?? true
      ..showDeletedMessages = json['showDeletedMessages'] as bool? ?? false
      ..showZeroWidth = json['showZeroWidth'] as bool? ?? false
      ..showChatMessageDividers =
          json['showChatMessageDividers'] as bool? ?? false
      ..timestampType = $enumDecodeNullable(
              _$TimestampTypeEnumMap, json['timestampType'],
              unknownValue: TimestampType.disabled) ??
          TimestampType.disabled
      ..useReadableColors = json['useReadableColors'] as bool? ?? true
      ..fontSize = (json['fontSize'] as num?)?.toDouble() ?? 12.0
      ..messageSpacing = (json['messageSpacing'] as num?)?.toDouble() ?? 10.0
      ..messageScale = (json['messageScale'] as num?)?.toDouble() ?? 1.0
      ..badgeScale = (json['badgeScale'] as num?)?.toDouble() ?? 1.0
      ..emoteScale = (json['emoteScale'] as num?)?.toDouble() ?? 1.0
      ..autocomplete = json['autocomplete'] as bool? ?? true
      ..chatWidth = (json['chatWidth'] as num?)?.toDouble() ?? 0.3
      ..landscapeChatLeftSide = json['landscapeChatLeftSide'] as bool? ?? false
      ..fullScreenChatOverlayOpacity =
          (json['fullScreenChatOverlayOpacity'] as num?)?.toDouble() ?? 0.5
      ..sendCrashLogs = json['sendCrashLogs'] as bool? ?? true
      ..fullScreen = json['fullScreen'] as bool? ?? false
      ..expandInfo = json['expandInfo'] as bool? ?? true
      ..fullScreenChatOverlay = json['fullScreenChatOverlay'] as bool? ?? false
      ..chatDelay = (json['chatDelay'] as num?)?.toDouble() ?? 0.0;

Map<String, dynamic> _$SettingsStoreToJson(SettingsStore instance) =>
    <String, dynamic>{
      'themeType': _$ThemeTypeEnumMap[instance.themeType],
      'showThumbnailUptime': instance.showThumbnailUptime,
      'showThumbnails': instance.showThumbnails,
      'launchUrlExternal': instance.launchUrlExternal,
      'showVideo': instance.showVideo,
      'showOverlay': instance.showOverlay,
      'toggleableOverlay': instance.toggleableOverlay,
      'pictureInPicture': instance.pictureInPicture,
      'overlayOpacity': instance.overlayOpacity,
      'showBottomBar': instance.showBottomBar,
      'showDeletedMessages': instance.showDeletedMessages,
      'showZeroWidth': instance.showZeroWidth,
      'showChatMessageDividers': instance.showChatMessageDividers,
      'timestampType': _$TimestampTypeEnumMap[instance.timestampType],
      'useReadableColors': instance.useReadableColors,
      'fontSize': instance.fontSize,
      'messageSpacing': instance.messageSpacing,
      'messageScale': instance.messageScale,
      'badgeScale': instance.badgeScale,
      'emoteScale': instance.emoteScale,
      'autocomplete': instance.autocomplete,
      'chatWidth': instance.chatWidth,
      'landscapeChatLeftSide': instance.landscapeChatLeftSide,
      'fullScreenChatOverlayOpacity': instance.fullScreenChatOverlayOpacity,
      'sendCrashLogs': instance.sendCrashLogs,
      'fullScreen': instance.fullScreen,
      'expandInfo': instance.expandInfo,
      'fullScreenChatOverlay': instance.fullScreenChatOverlay,
      'chatDelay': instance.chatDelay,
    };

const _$ThemeTypeEnumMap = {
  ThemeType.system: 'system',
  ThemeType.light: 'light',
  ThemeType.dark: 'dark',
  ThemeType.black: 'black',
};

const _$TimestampTypeEnumMap = {
  TimestampType.disabled: 'disabled',
  TimestampType.twelve: 'twelve',
  TimestampType.twentyFour: 'twentyFour',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStoreBase, Store {
  late final _$themeTypeAtom =
      Atom(name: '_SettingsStoreBase.themeType', context: context);

  @override
  ThemeType get themeType {
    _$themeTypeAtom.reportRead();
    return super.themeType;
  }

  @override
  set themeType(ThemeType value) {
    _$themeTypeAtom.reportWrite(value, super.themeType, () {
      super.themeType = value;
    });
  }

  late final _$showThumbnailUptimeAtom =
      Atom(name: '_SettingsStoreBase.showThumbnailUptime', context: context);

  @override
  bool get showThumbnailUptime {
    _$showThumbnailUptimeAtom.reportRead();
    return super.showThumbnailUptime;
  }

  @override
  set showThumbnailUptime(bool value) {
    _$showThumbnailUptimeAtom.reportWrite(value, super.showThumbnailUptime, () {
      super.showThumbnailUptime = value;
    });
  }

  late final _$showThumbnailsAtom =
      Atom(name: '_SettingsStoreBase.showThumbnails', context: context);

  @override
  bool get showThumbnails {
    _$showThumbnailsAtom.reportRead();
    return super.showThumbnails;
  }

  @override
  set showThumbnails(bool value) {
    _$showThumbnailsAtom.reportWrite(value, super.showThumbnails, () {
      super.showThumbnails = value;
    });
  }

  late final _$launchUrlExternalAtom =
      Atom(name: '_SettingsStoreBase.launchUrlExternal', context: context);

  @override
  bool get launchUrlExternal {
    _$launchUrlExternalAtom.reportRead();
    return super.launchUrlExternal;
  }

  @override
  set launchUrlExternal(bool value) {
    _$launchUrlExternalAtom.reportWrite(value, super.launchUrlExternal, () {
      super.launchUrlExternal = value;
    });
  }

  late final _$showVideoAtom =
      Atom(name: '_SettingsStoreBase.showVideo', context: context);

  @override
  bool get showVideo {
    _$showVideoAtom.reportRead();
    return super.showVideo;
  }

  @override
  set showVideo(bool value) {
    _$showVideoAtom.reportWrite(value, super.showVideo, () {
      super.showVideo = value;
    });
  }

  late final _$showOverlayAtom =
      Atom(name: '_SettingsStoreBase.showOverlay', context: context);

  @override
  bool get showOverlay {
    _$showOverlayAtom.reportRead();
    return super.showOverlay;
  }

  @override
  set showOverlay(bool value) {
    _$showOverlayAtom.reportWrite(value, super.showOverlay, () {
      super.showOverlay = value;
    });
  }

  late final _$toggleableOverlayAtom =
      Atom(name: '_SettingsStoreBase.toggleableOverlay', context: context);

  @override
  bool get toggleableOverlay {
    _$toggleableOverlayAtom.reportRead();
    return super.toggleableOverlay;
  }

  @override
  set toggleableOverlay(bool value) {
    _$toggleableOverlayAtom.reportWrite(value, super.toggleableOverlay, () {
      super.toggleableOverlay = value;
    });
  }

  late final _$pictureInPictureAtom =
      Atom(name: '_SettingsStoreBase.pictureInPicture', context: context);

  @override
  bool get pictureInPicture {
    _$pictureInPictureAtom.reportRead();
    return super.pictureInPicture;
  }

  @override
  set pictureInPicture(bool value) {
    _$pictureInPictureAtom.reportWrite(value, super.pictureInPicture, () {
      super.pictureInPicture = value;
    });
  }

  late final _$overlayOpacityAtom =
      Atom(name: '_SettingsStoreBase.overlayOpacity', context: context);

  @override
  double get overlayOpacity {
    _$overlayOpacityAtom.reportRead();
    return super.overlayOpacity;
  }

  @override
  set overlayOpacity(double value) {
    _$overlayOpacityAtom.reportWrite(value, super.overlayOpacity, () {
      super.overlayOpacity = value;
    });
  }

  late final _$showBottomBarAtom =
      Atom(name: '_SettingsStoreBase.showBottomBar', context: context);

  @override
  bool get showBottomBar {
    _$showBottomBarAtom.reportRead();
    return super.showBottomBar;
  }

  @override
  set showBottomBar(bool value) {
    _$showBottomBarAtom.reportWrite(value, super.showBottomBar, () {
      super.showBottomBar = value;
    });
  }

  late final _$showDeletedMessagesAtom =
      Atom(name: '_SettingsStoreBase.showDeletedMessages', context: context);

  @override
  bool get showDeletedMessages {
    _$showDeletedMessagesAtom.reportRead();
    return super.showDeletedMessages;
  }

  @override
  set showDeletedMessages(bool value) {
    _$showDeletedMessagesAtom.reportWrite(value, super.showDeletedMessages, () {
      super.showDeletedMessages = value;
    });
  }

  late final _$showZeroWidthAtom =
      Atom(name: '_SettingsStoreBase.showZeroWidth', context: context);

  @override
  bool get showZeroWidth {
    _$showZeroWidthAtom.reportRead();
    return super.showZeroWidth;
  }

  @override
  set showZeroWidth(bool value) {
    _$showZeroWidthAtom.reportWrite(value, super.showZeroWidth, () {
      super.showZeroWidth = value;
    });
  }

  late final _$showChatMessageDividersAtom = Atom(
      name: '_SettingsStoreBase.showChatMessageDividers', context: context);

  @override
  bool get showChatMessageDividers {
    _$showChatMessageDividersAtom.reportRead();
    return super.showChatMessageDividers;
  }

  @override
  set showChatMessageDividers(bool value) {
    _$showChatMessageDividersAtom
        .reportWrite(value, super.showChatMessageDividers, () {
      super.showChatMessageDividers = value;
    });
  }

  late final _$timestampTypeAtom =
      Atom(name: '_SettingsStoreBase.timestampType', context: context);

  @override
  TimestampType get timestampType {
    _$timestampTypeAtom.reportRead();
    return super.timestampType;
  }

  @override
  set timestampType(TimestampType value) {
    _$timestampTypeAtom.reportWrite(value, super.timestampType, () {
      super.timestampType = value;
    });
  }

  late final _$useReadableColorsAtom =
      Atom(name: '_SettingsStoreBase.useReadableColors', context: context);

  @override
  bool get useReadableColors {
    _$useReadableColorsAtom.reportRead();
    return super.useReadableColors;
  }

  @override
  set useReadableColors(bool value) {
    _$useReadableColorsAtom.reportWrite(value, super.useReadableColors, () {
      super.useReadableColors = value;
    });
  }

  late final _$fontSizeAtom =
      Atom(name: '_SettingsStoreBase.fontSize', context: context);

  @override
  double get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  late final _$messageSpacingAtom =
      Atom(name: '_SettingsStoreBase.messageSpacing', context: context);

  @override
  double get messageSpacing {
    _$messageSpacingAtom.reportRead();
    return super.messageSpacing;
  }

  @override
  set messageSpacing(double value) {
    _$messageSpacingAtom.reportWrite(value, super.messageSpacing, () {
      super.messageSpacing = value;
    });
  }

  late final _$messageScaleAtom =
      Atom(name: '_SettingsStoreBase.messageScale', context: context);

  @override
  double get messageScale {
    _$messageScaleAtom.reportRead();
    return super.messageScale;
  }

  @override
  set messageScale(double value) {
    _$messageScaleAtom.reportWrite(value, super.messageScale, () {
      super.messageScale = value;
    });
  }

  late final _$badgeScaleAtom =
      Atom(name: '_SettingsStoreBase.badgeScale', context: context);

  @override
  double get badgeScale {
    _$badgeScaleAtom.reportRead();
    return super.badgeScale;
  }

  @override
  set badgeScale(double value) {
    _$badgeScaleAtom.reportWrite(value, super.badgeScale, () {
      super.badgeScale = value;
    });
  }

  late final _$emoteScaleAtom =
      Atom(name: '_SettingsStoreBase.emoteScale', context: context);

  @override
  double get emoteScale {
    _$emoteScaleAtom.reportRead();
    return super.emoteScale;
  }

  @override
  set emoteScale(double value) {
    _$emoteScaleAtom.reportWrite(value, super.emoteScale, () {
      super.emoteScale = value;
    });
  }

  late final _$autocompleteAtom =
      Atom(name: '_SettingsStoreBase.autocomplete', context: context);

  @override
  bool get autocomplete {
    _$autocompleteAtom.reportRead();
    return super.autocomplete;
  }

  @override
  set autocomplete(bool value) {
    _$autocompleteAtom.reportWrite(value, super.autocomplete, () {
      super.autocomplete = value;
    });
  }

  late final _$chatWidthAtom =
      Atom(name: '_SettingsStoreBase.chatWidth', context: context);

  @override
  double get chatWidth {
    _$chatWidthAtom.reportRead();
    return super.chatWidth;
  }

  @override
  set chatWidth(double value) {
    _$chatWidthAtom.reportWrite(value, super.chatWidth, () {
      super.chatWidth = value;
    });
  }

  late final _$landscapeChatLeftSideAtom =
      Atom(name: '_SettingsStoreBase.landscapeChatLeftSide', context: context);

  @override
  bool get landscapeChatLeftSide {
    _$landscapeChatLeftSideAtom.reportRead();
    return super.landscapeChatLeftSide;
  }

  @override
  set landscapeChatLeftSide(bool value) {
    _$landscapeChatLeftSideAtom.reportWrite(value, super.landscapeChatLeftSide,
        () {
      super.landscapeChatLeftSide = value;
    });
  }

  late final _$fullScreenChatOverlayOpacityAtom = Atom(
      name: '_SettingsStoreBase.fullScreenChatOverlayOpacity',
      context: context);

  @override
  double get fullScreenChatOverlayOpacity {
    _$fullScreenChatOverlayOpacityAtom.reportRead();
    return super.fullScreenChatOverlayOpacity;
  }

  @override
  set fullScreenChatOverlayOpacity(double value) {
    _$fullScreenChatOverlayOpacityAtom
        .reportWrite(value, super.fullScreenChatOverlayOpacity, () {
      super.fullScreenChatOverlayOpacity = value;
    });
  }

  late final _$sendCrashLogsAtom =
      Atom(name: '_SettingsStoreBase.sendCrashLogs', context: context);

  @override
  bool get sendCrashLogs {
    _$sendCrashLogsAtom.reportRead();
    return super.sendCrashLogs;
  }

  @override
  set sendCrashLogs(bool value) {
    _$sendCrashLogsAtom.reportWrite(value, super.sendCrashLogs, () {
      super.sendCrashLogs = value;
    });
  }

  late final _$fullScreenAtom =
      Atom(name: '_SettingsStoreBase.fullScreen', context: context);

  @override
  bool get fullScreen {
    _$fullScreenAtom.reportRead();
    return super.fullScreen;
  }

  @override
  set fullScreen(bool value) {
    _$fullScreenAtom.reportWrite(value, super.fullScreen, () {
      super.fullScreen = value;
    });
  }

  late final _$expandInfoAtom =
      Atom(name: '_SettingsStoreBase.expandInfo', context: context);

  @override
  bool get expandInfo {
    _$expandInfoAtom.reportRead();
    return super.expandInfo;
  }

  @override
  set expandInfo(bool value) {
    _$expandInfoAtom.reportWrite(value, super.expandInfo, () {
      super.expandInfo = value;
    });
  }

  late final _$fullScreenChatOverlayAtom =
      Atom(name: '_SettingsStoreBase.fullScreenChatOverlay', context: context);

  @override
  bool get fullScreenChatOverlay {
    _$fullScreenChatOverlayAtom.reportRead();
    return super.fullScreenChatOverlay;
  }

  @override
  set fullScreenChatOverlay(bool value) {
    _$fullScreenChatOverlayAtom.reportWrite(value, super.fullScreenChatOverlay,
        () {
      super.fullScreenChatOverlay = value;
    });
  }

  late final _$chatDelayAtom =
      Atom(name: '_SettingsStoreBase.chatDelay', context: context);

  @override
  double get chatDelay {
    _$chatDelayAtom.reportRead();
    return super.chatDelay;
  }

  @override
  set chatDelay(double value) {
    _$chatDelayAtom.reportWrite(value, super.chatDelay, () {
      super.chatDelay = value;
    });
  }

  late final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase', context: context);

  @override
  void reset() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeType: ${themeType},
showThumbnailUptime: ${showThumbnailUptime},
showThumbnails: ${showThumbnails},
launchUrlExternal: ${launchUrlExternal},
showVideo: ${showVideo},
showOverlay: ${showOverlay},
toggleableOverlay: ${toggleableOverlay},
pictureInPicture: ${pictureInPicture},
overlayOpacity: ${overlayOpacity},
showBottomBar: ${showBottomBar},
showDeletedMessages: ${showDeletedMessages},
showZeroWidth: ${showZeroWidth},
showChatMessageDividers: ${showChatMessageDividers},
timestampType: ${timestampType},
useReadableColors: ${useReadableColors},
fontSize: ${fontSize},
messageSpacing: ${messageSpacing},
messageScale: ${messageScale},
badgeScale: ${badgeScale},
emoteScale: ${emoteScale},
autocomplete: ${autocomplete},
chatWidth: ${chatWidth},
landscapeChatLeftSide: ${landscapeChatLeftSide},
fullScreenChatOverlayOpacity: ${fullScreenChatOverlayOpacity},
sendCrashLogs: ${sendCrashLogs},
fullScreen: ${fullScreen},
expandInfo: ${expandInfo},
fullScreenChatOverlay: ${fullScreenChatOverlay},
chatDelay: ${chatDelay}
    ''';
  }
}
