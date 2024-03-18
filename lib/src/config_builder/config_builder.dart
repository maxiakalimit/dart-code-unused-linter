import '../analyzers/unused_code_analyzer/unused_code_analysis_config.dart';
import '../analyzers/unused_code_analyzer/unused_code_config.dart';
import '../analyzers/unused_files_analyzer/unused_files_analysis_config.dart';
import '../analyzers/unused_files_analyzer/unused_files_config.dart';
import '../analyzers/unused_l10n_analyzer/unused_l10n_analysis_config.dart';
import '../analyzers/unused_l10n_analyzer/unused_l10n_config.dart';
import '../utils/exclude_utils.dart';
import 'models/analysis_options.dart';

/// Builder for creating a config for all available commands.
class ConfigBuilder {
  /// Creates a raw unused files config from given [excludePatterns].
  static UnusedFilesConfig getUnusedFilesConfigFromArgs(
    Iterable<String> excludePatterns, {
    required bool isMonorepo,
    required bool shouldPrintConfig,
  }) =>
      UnusedFilesConfig.fromArgs(
        excludePatterns,
        isMonorepo: isMonorepo,
        shouldPrintConfig: shouldPrintConfig,
      );

  /// Creates a raw unused files config from given [options].
  static UnusedFilesConfig getUnusedFilesConfigFromOption(
    AnalysisOptions options,
  ) =>
      UnusedFilesConfig.fromAnalysisOptions(options);

  /// Creates an unused files config from given raw [config].
  static UnusedFilesAnalysisConfig getUnusedFilesConfig(
    UnusedFilesConfig config,
    String rootPath,
  ) =>
      UnusedFilesAnalysisConfig(
        createAbsolutePatterns(config.excludePatterns, rootPath),
        isMonorepo: config.isMonorepo,
      );

  /// Creates a raw unused code config from given [excludePatterns].
  static UnusedCodeConfig getUnusedCodeConfigFromArgs(
    Iterable<String> excludePatterns, {
    required bool isMonorepo,
    required bool shouldPrintConfig,
  }) =>
      UnusedCodeConfig.fromArgs(
        excludePatterns,
        isMonorepo: isMonorepo,
        shouldPrintConfig: shouldPrintConfig,
      );

  /// Creates a raw unused code config from given [options].
  static UnusedCodeConfig getUnusedCodeConfigFromOption(
    AnalysisOptions options,
  ) =>
      UnusedCodeConfig.fromAnalysisOptions(options);

  /// Creates an unused code config from given raw [config].
  static UnusedCodeAnalysisConfig getUnusedCodeConfig(
    UnusedCodeConfig config,
    String rootPath,
  ) =>
      UnusedCodeAnalysisConfig(
        createAbsolutePatterns(config.excludePatterns, rootPath),
        createAbsolutePatterns(config.analyzerExcludePatterns, rootPath),
        isMonorepo: config.isMonorepo,
      );

  /// Creates a raw unused localization config from given [excludePatterns] and [classPattern].
  static UnusedL10nConfig getUnusedL10nConfigFromArgs(
    Iterable<String> excludePatterns,
    String classPattern, {
    required bool shouldPrintConfig,
  }) =>
      UnusedL10nConfig.fromArgs(
        excludePatterns,
        classPattern,
        shouldPrintConfig: shouldPrintConfig,
      );

  /// Creates a raw unused localization config from given [options].
  static UnusedL10nConfig getUnusedL10nConfigFromOption(
    AnalysisOptions options,
  ) =>
      UnusedL10nConfig.fromAnalysisOptions(options);

  /// Creates an unused localization config from given raw [config].
  static UnusedL10nAnalysisConfig getUnusedL10nConfig(
    UnusedL10nConfig config,
    String rootPath,
  ) =>
      UnusedL10nAnalysisConfig(
        createAbsolutePatterns(config.excludePatterns, rootPath),
        config.classPattern,
      );
}
