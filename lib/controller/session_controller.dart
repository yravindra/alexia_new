// Flutter imports:

// Package imports:
import 'dart:async';

import 'package:alexia/interface/current_info.dart';
import 'package:alexia/interface/option.dart';
import 'package:alexia/interface/services/profile_service.dart';
import 'package:alexia/interface/zones.dart';
import 'package:get/get.dart';

// Project imports:
import '../interface/services/storage_service.dart';
import '../utils/get_logger.dart';

const SESSION_TOKEN_KEY = "session_token";
const NAME_KEY = "name";
const USERNAME_KEY = "username";
const MOBILE_KEY = "mobile";

typedef SessionCallback = void Function(String, String);

const String defaultSession = "";

final zone = Zones(
  id: "",
  name: "",
  startTime: null,
  endTime: null,
);

final option = Option(
  id: "",
  catName: "",
  shortName: "",
);

final defaultCurrentInfo = CurrentInfo(currentZone: "", deviceType: "");

class SessionController extends GetxController {
  final StorageService storage;
  final RxString _sessionToken = "".obs;
  final RxString _name = "".obs;
  final RxString _mobile = "".obs;
  final RxString _username = "".obs;
  final RxString _selectedZone = "".obs;
  final RxString _checkInType = "".obs;
  final RxString _visitorCode = "".obs;
  final RxBool _introVisited = false.obs;
  final RxList<Zones> _zones = [zone].obs;
  final RxList<Option> _categories = [option].obs;
  final RxList<Option> _documentTypes = [option].obs;
  final Rx<CurrentInfo> _currentInfo = defaultCurrentInfo.obs;
  final RxList _searchVisitors = [].obs;
  final RxString _photoUrl = "".obs;
  final RxString _photoIdUrl = "".obs;
  final RxString _vaccineIdUrl = "".obs;
  final RxString _filterSelectedGate = "".obs;
  final RxString _filterSelectedDate = "".obs;

  final SessionCallback? onSessionFetch;

  SessionController({
    required this.storage,
    this.onSessionFetch,
  });

  bool get isLoggedIn {
    final session = _sessionToken.value;

    final isLoggedIn = session != defaultSession;

    return isLoggedIn;
  }

  String get token => _sessionToken.value;

  String get name => _name.value;

  String get mobile => _mobile.value;

  String get selectedZone => _selectedZone.value;

  bool get hasVisitedIntro => _introVisited.value;

  String get checkInType => _checkInType.value;

  String get visitorCode => _visitorCode.value;

  String get photoUrl => _photoUrl.value;

  String get photoIdUrl => _photoIdUrl.value;

  String get vaccineIdUrl => _vaccineIdUrl.value;

  String get selectedFilterGate => _filterSelectedGate.value;

  String get selectedFilterDate => _filterSelectedDate.value;

  List<Zones> get zones => _zones.value;

  List get categories => _categories.value;

  List get searchVisitors => _searchVisitors.value;

  List get docsType => _documentTypes.value;

  setVisitorCode(String code) {
    _visitorCode.value = code;
  }

  setSelectedFilterGate(String gateName) {
    _filterSelectedGate.value = gateName;
  }

  setSelectedFilterDate(String dateTime) {
    _filterSelectedDate.value = dateTime;
  }

  setPhotoUrl(String photoUrl) {
    _photoUrl.value = photoUrl;
  }

  setPhotoIdUrl(String photoIdUrl) {
    _photoIdUrl.value = photoIdUrl;
  }

  setVaccineIdUrl(String vaccineIdUrl) {
    _vaccineIdUrl.value = vaccineIdUrl;
  }

  setSelectedZone(String selectedZone) {
    _selectedZone.value = selectedZone;
  }

  setCheckType(String checkType) {
    _checkInType.value = checkType;
  }

  setSearchVisitors(List visitors) {
    _searchVisitors.value = visitors;
  }

  bool get hasActiveProperty {
    if (!isLoggedIn) return false;

    final session = _sessionToken.value;

    if (session == "") return false;

    return true;
  }

  void _logThis() {
    final logger = getLogger();

    logger.d({
      "sessionToken": _sessionToken.value,
      "introVisited": _introVisited.value,
    });
  }

  Future<void> login({
    required ProfileService profileService,
    required String password,
    required String email,
  }) async {
    final profile = await profileService.getProfile(
      email: email,
      password: password,
    );

    _sessionToken.value = profile.token;
    _name.value = profile.name;
    _username.value = profile.username;
    _mobile.value = mobile;

    await storage.set(
      key: SESSION_TOKEN_KEY,
      raw: _sessionToken.value,
    );

    await storage.set(
      key: NAME_KEY,
      raw: _name.value,
    );

    await storage.set(
      key: USERNAME_KEY,
      raw: _username.value,
    );

    await storage.set(
      key: MOBILE_KEY,
      raw: _mobile.value,
    );

    _logThis();
  }


  Future<void> register({
    required ProfileService profileService,
    required String password,
    required String email,
    required String name,
  }) async {
    final profile = await profileService.registerProfile(
      email: email,
      password: password,
      name: name,
    );

    _sessionToken.value = profile.token;
    _name.value = profile.name;
    _username.value = profile.username;
    _mobile.value = mobile;

    await storage.set(
      key: SESSION_TOKEN_KEY,
      raw: _sessionToken.value,
    );

    await storage.set(
      key: NAME_KEY,
      raw: _name.value,
    );

    await storage.set(
      key: USERNAME_KEY,
      raw: _username.value,
    );

    await storage.set(
      key: MOBILE_KEY,
      raw: _mobile.value,
    );

    _logThis();
  }


  Future<void> loadFromStorage() async {
    final storage = this.storage;

    if (await storage.exists(key: SESSION_TOKEN_KEY)) {
      _sessionToken.value = await storage.getRaw(key: SESSION_TOKEN_KEY);
    } else {
      await storage.set(
        key: SESSION_TOKEN_KEY,
        raw: _sessionToken.value,
      );
    }

    if (await storage.exists(key: NAME_KEY)) {
      _name.value = await storage.getRaw(key: NAME_KEY);
    } else {
      await storage.set(
        key: NAME_KEY,
        raw: _name.value,
      );
    }

    if (await storage.exists(key: USERNAME_KEY)) {
      _username.value = await storage.getRaw(key: USERNAME_KEY);
    } else {
      await storage.set(
        key: USERNAME_KEY,
        raw: _username.value,
      );
    }

    if (await storage.exists(key: MOBILE_KEY)) {
      _mobile.value = await storage.getRaw(key: MOBILE_KEY);
    } else {
      await storage.set(
        key: MOBILE_KEY,
        raw: _mobile.value,
      );
    }

    _logThis();
  }

  Future<bool> verifySession({
    required ProfileService profileService,
  }) async {
    final session = _sessionToken.value;

    if (session == "") {
      return false;
    }

    final zones = await profileService.getZones(
      token: session,
    );

    _zones.value = zones;

    final categories = await profileService.getCategories(
      token: session,
    );

    _categories.value = categories;

    final documentTypes = await profileService.getDocumentType(
      token: session,
    );

    _documentTypes.value = documentTypes;

    final currentInfo = await profileService.getInfo(
      token: session,
    );

    _currentInfo.value = currentInfo;

    _selectedZone.value = currentInfo.currentZone;

    _checkInType.value = currentInfo.deviceType;

    if (_zones.value == [zone] ||
        _categories.value == [option] ||
        _documentTypes.value == [option]) {
      return false;
    }

    return true;
  }

  Future<void> logout() async {
    _sessionToken.value = "";

    await storage.set(
      key: SESSION_TOKEN_KEY,
      raw: _sessionToken.value,
    );

    _logThis();
  }
}
