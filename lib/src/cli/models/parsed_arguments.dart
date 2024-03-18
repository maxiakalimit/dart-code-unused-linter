import 'package:args/args.dart';

import 'flag_names.dart';

/// Represents the arguments parsed from raw cli arguments.
class ParsedArguments {
  final String excludePath;
  final String rootFolder;
  final String? jsonReportPath;
  final bool shouldPrintConfig;

  const ParsedArguments({
    required this.excludePath,
    required this.rootFolder,
    required this.shouldPrintConfig,
    this.jsonReportPath,
  });

  factory ParsedArguments.fromArgs(ArgResults argResults) => ParsedArguments(
        excludePath: argResults[FlagNames.exclude] as String,
        rootFolder: argResults[FlagNames.rootFolder] as String,
        jsonReportPath: argResults[FlagNames.jsonReportPath] as String?,
        shouldPrintConfig: argResults[FlagNames.printConfig] as bool,
      );
}
