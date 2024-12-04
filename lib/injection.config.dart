// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:parking_future/data/connection/fbs_adapter.dart' as _i234;
import 'package:parking_future/data/data_source.dart' as _i451;
import 'package:parking_future/domain/connection/connector.dart' as _i545;
import 'package:parking_future/domain/connection/device_methods.dart' as _i277;
import 'package:parking_future/domain/repository/config.dart' as _i1007;
import 'package:parking_future/domain/storage/settings.dart' as _i361;
import 'package:parking_future/injection.dart' as _i17;
import 'package:parking_future/presentation/fragments/settings/provider.dart'
    as _i134;
import 'package:parking_future/presentation/pages/home/connection_provider.dart'
    as _i490;
import 'package:parking_future/presentation/pages/launch/cubit/launch_cubit.dart'
    as _i60;
import 'package:parking_future/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i1049;

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
    gh.factory<_i361.SettingsBox>(() => _i361.SettingsBox());
    gh.factory<_i60.LaunchCubit>(() => _i60.LaunchCubit());
    gh.singleton<_i234.FbsAdapter>(() => _i234.FbsAdapter());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i451.DataSource>(() => _i451.DataSource(gh<_i361.Dio>()));
    gh.factory<_i134.SettingsProvider>(
        () => _i134.SettingsProvider(gh<_i361.SettingsBox>()));
    gh.singleton<_i1007.ConfigRepository>(
        () => _i1007.ConfigRepository(gh<_i451.DataSource>()));
    gh.factory<_i545.Connector>(
        () => _i545.FbsConnector(gh<_i234.FbsAdapter>()));
    gh.factory<_i1049.ScanCubit>(() => _i1049.ScanCubit(
          gh<_i361.SettingsBox>(),
          gh<_i545.Connector>(),
        ));
    gh.factory<_i277.DeviceMethods>(
        () => _i277.FbsDeviceMethods(gh<_i234.FbsAdapter>()));
    gh.factory<_i490.ConnectionProvider>(() => _i490.ConnectionProvider(
          gh<_i277.DeviceMethods>(),
          gh<_i545.Connector>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
