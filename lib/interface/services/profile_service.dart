// Project imports:
import 'package:alexia/interface/current_info.dart';
import 'package:alexia/interface/option.dart';
import 'package:alexia/interface/profile.dart';
import 'package:alexia/interface/zones.dart';
import 'package:alexia/models/forgot_password.dart';

abstract class ProfileService {
  Future<Profile> getProfile({
    required String password,
    required String email,
  });

  Future<Forgot_password> getForgotPassword({
  required  String email,
    required String medium
});

  Future<Profile> registerProfile({
    required String password,
    required String name,
    required String email,
  });

  Future<List<Zones>> getZones({
    required String token,
  });

  Future<CurrentInfo> getInfo({
    required String token,
  });

  Future<List<Option>> getCategories({
    required String token,
  });

  Future<List<Option>> getDocumentType({
    required String token,
  });

  Future<String> switchZone({
    required String token,
    required String pinNumber,
    required String checkType,
    required String zone,
  });
}
