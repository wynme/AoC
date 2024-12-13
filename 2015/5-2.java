import java.util.*;


public class Main {
	private static int check(String S) {
		int N = S.length();
		boolean t = false;
		for (int i = 0; i < N - 1; i++) {
			for (int j = i + 2; j < N - 1; j++) {
				t |= S.substring(i, i + 2).equals(S.substring(j, j + 2));
			}
		}
		if (!t) return 0;

		for (int i = 0; i < N - 2; i++) {
			if (S.charAt(i) == S.charAt(i + 2)) return 1;
		}
		return 0;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int ans = 0;
		while (sc.hasNext()) {
			String S = sc.next();
			ans += check(S);
		}

		System.out.println(ans);
	}
}
