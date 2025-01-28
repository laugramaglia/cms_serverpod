extension TextExtension on String {
  String get capitalized =>
      isEmpty ? '' : this[0].toUpperCase() + substring(1).toLowerCase();

  String get capitalizedTexts => split(' ')
      .map((e) =>
          e.toLowerCase().contains('srl') ? e.toUpperCase() : e.capitalized)
      .join(' ');
}
