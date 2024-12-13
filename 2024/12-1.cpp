#include <bits/stdc++.h>

using namespace std;


int main(void)
{
	vector<string> G;
	string line;
	while (getline(cin, line)) G.push_back(line);

	int N = G.size(), M = G[0].length();
	vector went = vector<vector<bool>>(N, vector<bool>(M));
	int a = 0, p = 0;
	auto check = [&](int y, int x) -> bool {
		return y >= 0 && y < N && x >= 0 && x < M;
	};
	auto dfs = [&](this auto dfs, int y, int x) -> void {
		went[y][x] = true;
		a++; p += 4;
		int dy[] = {0, 0, 1, -1}, dx[] = {1, -1, 0, 0};
		for (int i = 0; i < 4; i++) {
			int ny = dy[i] + y, nx = dx[i] + x;
			if (check(ny, nx) && G[ny][nx] == G[y][x]) {
				p--;
				if (!went[ny][nx]) dfs(ny, nx);
			}
		}
	};

	int ans = 0;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			if (!went[i][j]) {
				dfs(i, j);
				ans += a * p;
				a = 0, p = 0;
			}
		}
	}
	cout << ans << '\n';
	return EXIT_SUCCESS;
}
