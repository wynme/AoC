#include <bits/stdc++.h>

using namespace std;
using pii = pair<int, int>;


int main(void) {
	int N = 140;
	vector<string> G(N);
	for (int i = 0; i < N; i++) {
		cin >> G[i];
	}

	int ans = 0;
	auto ok = [&](int y, int x, int i) -> bool {
		return y >= 0 && y < N && x >= 0 && x < N && G[y][x] == "XMAS"[i];
	};
	// UNIDIRECTIONAL! Fake dfs
	auto dfs = [&](int y, int x, int idx) -> void {
		int dy[] = {0, 0, 1, -1, 1, -1, 1, -1};
		int dx[] = {1, -1, 0, 0, 1, -1, -1, 1};
		
		for (int i = 0; i < 8; i++) {
			int ny = y, nx = x;
			for (int j = 0; j < 3; j++) {
				ny += dy[i], nx += dx[i];
				if (!ok(ny, nx, idx + j)) break;
				if (ok(ny, nx, idx + j) && j == 2) ans++;
			}
		}
	};

	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			if (G[i][j] == 'X') dfs(i, j, 1);
		}
	}

	cout << ans << '\n';
	return EXIT_SUCCESS;
}
