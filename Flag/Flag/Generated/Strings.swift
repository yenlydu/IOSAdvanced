// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Algeria
  internal static let algeria = L10n.tr("Localize", "algeria")
  /// Alsace
  internal static let alsace = L10n.tr("Localize", "alsace")
  /// Belgium
  internal static let belgium = L10n.tr("Localize", "belgium")
  /// Canada
  internal static let canada = L10n.tr("Localize", "canada")
  /// Egypt
  internal static let egypt = L10n.tr("Localize", "egypt")
  /// France
  internal static let france = L10n.tr("Localize", "france")
  /// Germany
  internal static let germany = L10n.tr("Localize", "germany")
  /// Italy
  internal static let italy = L10n.tr("Localize", "italy")
  /// Marocco
  internal static let marocco = L10n.tr("Localize", "marocco")
  /// Mexico
  internal static let mexico = L10n.tr("Localize", "mexico")
  /// Netherlands
  internal static let netherlands = L10n.tr("Localize", "netherlands")
  /// Portugal
  internal static let portugal = L10n.tr("Localize", "portugal")
  /// Spain
  internal static let spain = L10n.tr("Localize", "spain")
  /// Sweden
  internal static let sweden = L10n.tr("Localize", "sweden")
  /// Switzerland
  internal static let switzerland = L10n.tr("Localize", "switzerland")
  /// Turkey
  internal static let turkey = L10n.tr("Localize", "turkey")
  /// Great Britain
  internal static let uk = L10n.tr("Localize", "uk")
  /// United States of America
  internal static let usa = L10n.tr("Localize", "usa")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
