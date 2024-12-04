// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:avtonalivator/data/connection/fbs_adapter.dart' as _i88;
import 'package:avtonalivator/data/data_source.dart' as _i380;
import 'package:avtonalivator/domain/connection/connector.dart' as _i391;
import 'package:avtonalivator/domain/connection/device_methods.dart' as _i682;
import 'package:avtonalivator/domain/repository/config.dart' as _i685;
import 'package:avtonalivator/domain/storage/settings.dart' as _i191;
import 'package:avtonalivator/injection.dart' as _i706;
import 'package:avtonalivator/presentation/fragments/settings/provider.dart'
    as _i728;
import 'package:avtonalivator/presentation/pages/home/connection_provider.dart'
    as _i441;
import 'package:avtonalivator/presentation/pages/launch/cubit/launch_cubit.dart'
    as _i893;
import 'package:avtonalivator/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i373;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i191.SettingsBox>(() => _i191.SettingsBox());
    gh.factory<_i893.LaunchCubit>(() => _i893.LaunchCubit());
    gh.singleton<_i88.FbsAdapter>(() => _i88.FbsAdapter());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i380.DataSource>(() => _i380.DataSource(gh<_i361.Dio>()));
    gh.factory<_i391.Connector>(
        () => _i391.FbsConnector(gh<_i88.FbsAdapter>()));
    gh.singleton<_i685.ConfigRepository>(
        () => _i685.ConfigRepository(gh<_i380.DataSource>()));
    gh.factory<_i373.ScanCubit>(() => _i373.ScanCubit(
          gh<_i191.SettingsBox>(),
          gh<_i391.Connector>(),
        ));
    gh.factory<_i682.DeviceMethods>(
        () => _i682.FbsDeviceMethods(gh<_i88.FbsAdapter>()));
    gh.factory<_i441.ConnectionProvider>(() => _i441.ConnectionProvider(
          gh<_i682.DeviceMethods>(),
          gh<_i391.Connector>(),
        ));
    gh.factory<_i728.SettingsProvider>(
        () => _i728.SettingsProvider(gh<_i191.SettingsBox>()));
    return this;
  }
}

class _$RegisterModule extends _i706.RegisterModule {}
