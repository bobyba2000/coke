import 'dart:math';

class StringUtility {
  static int levenshteinDistance(String s, String t) {
    int m = s.length;
    int n = t.length;

    if (m == 0) return n;
    if (n == 0) return m;

    List<List<int>> d = List.generate(m + 1, (_) => List.filled(n + 1, 0));

    for (int i = 0; i <= m; i++) {
      d[i][0] = i;
    }
    for (int j = 0; j <= n; j++) {
      d[0][j] = j;
    }

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        int cost = (s[i - 1] == t[j - 1]) ? 0 : 1;
        d[i][j] = min(
          min(d[i - 1][j] + 1, d[i][j - 1] + 1),
          d[i - 1][j - 1] + cost,
        );
      }
    }

    return d[m][n];
  }

  static double compare(String a, String b) {
    final lowercaseA = a.toLowerCase();
    final lowercaseB = b.toLowerCase();
    if (lowercaseB.contains(lowercaseA) || lowercaseA.contains(lowercaseB)) {
      return 1;
    }
    int distance = levenshteinDistance(lowercaseA, lowercaseB);
    int maxLength = max(lowercaseB.length, lowercaseA.length);

    if (maxLength == 0) return 1;

    double similarity = ((maxLength - distance) / maxLength);
    return similarity;
  }
}
