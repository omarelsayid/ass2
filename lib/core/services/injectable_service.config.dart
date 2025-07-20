// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repos/notes_repo.dart' as _i996;
import '../../data/repos/notes_repo_imp.dart' as _i486;
import '../../presentation/cubits/notes_cubit.dart' as _i952;
import 'data_base_services.dart' as _i875;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i875.DataBaseService>(() => _i875.DataBaseService());
    gh.factory<_i996.NotesRepo>(
      () => _i486.NotesRepoImp(dataBaseService: gh<_i875.DataBaseService>()),
    );
    gh.factory<_i952.NotesCubit>(() => _i952.NotesCubit(gh<_i996.NotesRepo>()));
    return this;
  }
}
