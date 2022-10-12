// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i11;

import 'interface/app_route.dart' as _i9;
import 'interface/services/profile_service.dart' as _i25;
import 'interface/services/report_service.dart' as _i27;
import 'interface/services/scan_service.dart' as _i29;
import 'interface/services/storage_service.dart' as _i19;
import 'modules/application.dart' as _i23;
import 'modules/atom_api.dart' as _i34;
import 'modules/http.dart' as _i31;
import 'modules/local_storage.dart' as _i20;
import 'modules/logger.dart' as _i33;
import 'modules/routes.dart' as _i32;
import 'modules/services/profile_service.dart' as _i26;
import 'modules/services/report_service.dart' as _i28;
import 'modules/services/scan_service.dart' as _i30;
import 'routes/course.dart' as _i4;
import 'routes/forget_password.dart' as _i5;
import 'routes/home.dart' as _i6;
import 'routes/homework.dart' as _i7;
import 'routes/intro.dart' as _i8;
import 'routes/login.dart' as _i12;
import 'routes/login_with.dart' as _i13;
import 'routes/profile.dart' as _i14;
import 'routes/register.dart' as _i15;
import 'routes/scanner.dart' as _i16;
import 'routes/search_visitor.dart' as _i17;
import 'routes/splash.dart' as _i18;
import 'routes/visitor_details.dart' as _i21;
import 'routes/visitor_profile.dart' as _i22;
import 'utils/http.dart' as _i24;
import 'widget/navbar/navitem.dart' as _i10;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final httpClientModule = _$HttpClientModule();
  final appRoutesModule = _$AppRoutesModule();
  final logModule = _$LogModule();
  final atomApiModule = _$AtomApiModule();
  gh.singleton<_i3.Client>(
    httpClientModule.httpClientProd,
    registerFor: {
      _prod,
      _dev,
    },
  );
  gh.singleton<_i3.Client>(
    httpClientModule.httpClientTest,
    registerFor: {_test},
  );
  gh.factory<_i4.CourseRoute>(() => _i4.CourseRoute());
  gh.factory<_i5.ForgetPasswordRoute>(() => _i5.ForgetPasswordRoute());
  gh.factory<_i6.HomeRoute>(() => _i6.HomeRoute());
  gh.factory<_i7.HomeworkRoute>(() => _i7.HomeworkRoute());
  gh.factory<_i8.IntroRoute>(() => _i8.IntroRoute());
  gh.lazySingleton<List<_i9.AppRoute>>(() => appRoutesModule.appRoutes);
  gh.singleton<List<_i10.NavItem>>(appRoutesModule.navItems);
  gh.singleton<_i11.Logger>(
    logModule.getLoggerTest(),
    registerFor: {_test},
  );
  gh.singleton<_i11.Logger>(
    logModule.getLoggerDev(),
    registerFor: {_dev},
  );
  gh.singleton<_i11.Logger>(
    logModule.getLoggerProd(),
    registerFor: {_prod},
  );
  gh.factory<_i12.LoginRoute>(() => _i12.LoginRoute());
  gh.factory<_i13.LoginWithRoute>(() => _i13.LoginWithRoute());
  gh.factory<_i14.ProfileRoute>(() => _i14.ProfileRoute());
  gh.factory<_i15.RegistrationRoute>(() => _i15.RegistrationRoute());
  gh.factory<_i16.ScannerRoute>(() => _i16.ScannerRoute());
  gh.factory<_i17.SearchVisitorRoute>(() => _i17.SearchVisitorRoute());
  gh.factory<_i18.SplashRoute>(() => _i18.SplashRoute());
  gh.singleton<_i19.StorageService>(
    _i20.LocalStorage(),
    registerFor: {
      _prod,
      _dev,
    },
  );
  gh.singleton<String>(
    appRoutesModule.initialRoute,
    instanceName: 'INITIAL_ROUTE',
  );
  gh.singleton<String>(
    atomApiModule.production,
    instanceName: 'KWEB_API',
    registerFor: {_prod},
  );
  gh.singleton<String>(
    atomApiModule.development,
    instanceName: 'KWEB_API',
    registerFor: {
      _dev,
      _test,
    },
  );
  gh.factory<_i21.VisitorDetailsRoute>(() => _i21.VisitorDetailsRoute());
  gh.factory<_i22.VisitorProfileRoute>(() => _i22.VisitorProfileRoute());
  gh.lazySingleton<_i23.Application>(() => _i23.Application(
        storage: get<_i19.StorageService>(),
        routes: get<List<_i9.AppRoute>>(),
        navItems: get<List<_i10.NavItem>>(),
        initialRoute: get<String>(instanceName: 'INITIAL_ROUTE'),
      ));
  gh.singleton<_i24.Http>(_i24.Http(
    logger: get<_i11.Logger>(),
    client: get<_i3.Client>(),
    storage: get<_i19.StorageService>(),
  ));
  gh.singleton<_i25.ProfileService>(
    _i26.ApiProfileService(
      api: get<String>(instanceName: 'KWEB_API'),
      http: get<_i24.Http>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.singleton<_i27.ReportService>(
    _i28.ApiReportService(
      api: get<String>(instanceName: 'KWEB_API'),
      http: get<_i24.Http>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.singleton<_i29.ScanService>(
    _i30.ApiScanService(
      api: get<String>(instanceName: 'KWEB_API'),
      http: get<_i24.Http>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return get;
}

class _$HttpClientModule extends _i31.HttpClientModule {}

class _$AppRoutesModule extends _i32.AppRoutesModule {}

class _$LogModule extends _i33.LogModule {}

class _$AtomApiModule extends _i34.AtomApiModule {}
