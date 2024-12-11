import java.util.*;


public class Main {
	private static int[] part1(int N, int K, int[] A) {
		// Necessary to edit array without affecting part2
		A = A.clone();
		int[] H = new int[N];
		Arrays.fill(H, -1);
		int s = 0, e = K - 1;
		for (int i = 0; s <= e; s++) {
			if (s % 2 == 0) {
				for (int j = 0; j < A[s]; j++) H[i + j] = s / 2;
			} else {
				for (int j = 0; j < A[s]; j++) {
					H[i + j] = e / 2;
					if (--A[e] == 0) e -= 2;
				}
			}
			i += A[s];
		}
		return H;
	}

	private static int[] part2(int N, int K, int[] A) {
		int[] H = new int[N];
		Arrays.fill(H, -1);
		for (int i = 0, s = 0; s < K; s++) {
			if (s % 2 == 0) {
				for (int j = 0; j < A[s]; j++) H[i + j] = s / 2;
			}
			i += A[s];
		}

		int[] p1 = new int[K / 2]; p1[0] = A[0];
		for (int i = 1; i < K / 2; i++) p1[i] = p1[i - 1] + A[2 * i] + A[2 * i - 1];
		// K is odd so files > spaces
		int[] p2 = new int[K / 2 + 1];
		for (int i = 0; i < K - 1; i++) p2[i / 2 + 1] += A[i];
		for (int i = 1; i < K / 2 + 1; i++) p2[i] += p2[i - 1];
		int[] S = new int[K / 2], F = new int[K / 2 + 1];
		for (int i = 0; i < K; i++) {
			if (i % 2 == 0) F[i / 2] = A[i];
			else S[i / 2] = A[i];
		}

		for (int i = F.length - 1; i >= 0; i--) {
			for (int j = 0; j < i; j++) {
				if (F[i] <= S[j]) {
					for (int k = 0; k < F[i]; k++) {
						H[p1[j] + k] = i;
						H[p2[i] + k] = -1;
					}
					S[j] -= F[i];
					p1[j] += F[i];
					break;
				}
			}
		}

		return H;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		String[] S = sc.next().split("");
		int N = S.length, sum = 0;
		int[] A = new int[N];
		for (int i = 0; i < N; i++) {
			A[i] = Integer.parseInt(S[i]);
			sum += A[i];
		}

		int[] p1 = part1(sum, N, A), p2 = part2(sum, N, A);
		long ans1 = 0, ans2 = 0;
		for (int i = 0; i < sum; i++) {
			if (p1[i] != -1) ans1 += p1[i] * i;
			if (p2[i] != -1) ans2 += p2[i] * i;
		}
		System.out.println(ans1);
		System.out.println(ans2);
	}
}
