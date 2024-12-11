#include <bits/stdc++.h>

using namespace std;
using pii = pair<int, int>;


int main(void)
{
	string line;
	vector<string> G;
	while (getline(cin, line)) G.push_back(line);

	int N = G.size(), M = G[0].length();
	set<pii> X;
	int p1 = 0, p2 = 0;
	auto dfs = [&](this auto dfs, int y, int x) -> void {
		if (G[y][x] == '9') {
			p2++;
			X.insert({y, x});
			return;
		}
		int dy[] = {-1, 1, 0, 0}, dx[] = {0, 0, -1, 1};
		for (int i = 0; i < 4; i++) {
			int ny = dy[i] + y, nx = dx[i] + x;
			if (ny >= 0 && ny < N && nx >= 0 && nx < M && G[ny][nx] == G[y][x] + 1) {
				dfs(ny, nx);
			}
		}
	};

	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			if (G[i][j] == '0') {
				dfs(i, j);
				p1 += X.size();
				X.clear();
			}
		}
	}

	cout << p1 << '\n' << p2 << '\n';
	return EXIT_SUCCESS;
}
