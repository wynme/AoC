import java.util.*;


public class Main {
	static int[] dy = {1, 1, -1, -1}, dx = {1, -1, 1, -1};
	static int N = 140;
	static String[] G = new String[N];


	static int check(int y, int x) {
		int mc = 0, sc = 0;
		for (int i = 0; i < 4; i++) {
			int ny = y + dy[i], nx = x + dx[i];
			if (ny >= 0 && ny < N && nx >= 0 && nx < N) {
				if (G[ny].charAt(nx) == 'M') mc++;
				if (G[ny].charAt(nx) == 'S') sc++;
			} else return 0;
		}

		boolean dneq = G[y - 1].charAt(x - 1) != G[y + 1].charAt(x + 1);
		return (dneq && mc == 2 && sc == 2) ? 1 : 0;
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		for (int i = 0; i < N; i++) {
			G[i] = sc.next();
		}

		int ans = 0;
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				if (G[i].charAt(j) == 'A') {
					ans += check(i, j);	
				}
			}
		}

		System.out.println(ans);
	}
}
