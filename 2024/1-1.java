import java.util.*;


public class Main {
	private static final int NN = 1000;
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int i = NN;
		int[] A = new int[i];
		int[] B = new int[i];
		while (i-- > 0) {
			A[i] = sc.nextInt();
			B[i] = sc.nextInt();
		}
		
		Arrays.sort(A);
		Arrays.sort(B);
		int ans = 0;
		for (i = 0; i < NN; i++) {
			ans += Math.abs(A[i] - B[i]);
		}
		System.out.println(ans);
	}
}
