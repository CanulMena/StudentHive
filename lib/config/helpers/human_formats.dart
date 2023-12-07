
class HumanFormats {

  static String formatNumber( number) {
    if (number < 1000) {
      return number.toString();
    }
    else if (number < 1000000) {
      double result = number / 1000.0;
      return '${result.toStringAsFixed(1)}K';
    } else {
      double result = number / 1000000.0;
      return '${result.toStringAsFixed(1)}M';
    }
  }
}

