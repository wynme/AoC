import java.util.*;


public class Main {
	private static long solve1(long N, long[] rest) {
		int K = rest.length;
		for (int bits = 0; bits < (1 << (K - 1)); bits++) {
			long res = rest[0];
			for (int e = 0; e < K - 1; e++) {
				if ((bits & (1 << e)) > 0) res += rest[e + 1];
				else res *= rest[e + 1];
			}

			if (res == N) return N;
		}
		return 0;
	}

	private static int[] base3(int N, int l) {
		int[] res = new int[l];
		for (int i = 0; i < l; i++) {
			res[l - i - 1] = N % 3;
			N /= 3;
		}
		return res;
	}

	private static long solve2(long N, long[] rest) {
		int K = rest.length;
		for (int i = 0; i < Math.pow(3, K - 1); i++) {
			int[] b3 = base3(i, K - 1);
			long res = rest[0];
			for (int j = 0; j < K - 1; j++) {
				if (b3[j] == 0) res += rest[j + 1];
				else if (b3[j] == 1) res *= rest[j + 1];
				else {
					String t = String.valueOf(res) + String.valueOf(rest[j + 1]);
					res = Long.parseLong(t);
				}
			}
			if (res == N) return N;
		}
		return 0;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		long ans1 = 0, ans2 = 0;
		while (sc.hasNextLine()) {
			String[] A = sc.nextLine().replace(":", "").split(" ");
			long N = Long.parseLong(A[0]);
			long[] rest = new long[A.length - 1];
			for (int i = 1; i < A.length; i++) {
				rest[i - 1] = Long.parseLong(A[i].strip());
			}
			ans1 += solve1(N, rest);
			ans2 += solve2(N, rest);
		}
		System.out.println(ans1);
		System.out.println(ans2);
	}
}
