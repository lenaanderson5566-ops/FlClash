import 'package:fastai/enum/enum.dart';
import 'package:fastai/l10n/l10n.dart';

extension ProviderSourceExt on ProviderSource {
  String label(AppLocalizations appLocalizations) => switch (this) {
    ProviderSource.subscription => appLocalizations.providerSourceSubscription,
    ProviderSource.profile => appLocalizations.profile,
    ProviderSource.app => appLocalizations.app,
  };
}
