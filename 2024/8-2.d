module day8_2;

import std;

bool check(int N, int M, int y, int x)
{
	return 0 <= y && y < N && 0 <= x && x < M;
}

void main()
{
	string[] G; string line;
	while ((line = readln.chomp) !is null) {
		G ~= line;
	}

	int N = cast(int)G.length, M = cast(int)G[0].length;
	bool[][] ok = new bool[][](N, M);
	Tuple!(int, int)[][char] R;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			if (G[i][j] != '.') {
				R[G[i][j]] ~= tuple(i, j);
				ok[i][j] = true;
			}
		}
	}

	foreach (l; R.byValue) {
		foreach (i, t1; l) {
			int y1 = t1[0], x1 = t1[1];
			foreach (t2; l[i + 1 .. $]) {
				int y2 = t2[0], x2 = t2[1];
				int dy = y1 - y2, dx = x1 - x2;
				int cy = y1, cx = x1;
				while (check(N, M, cy + dy, cx + dx)) {
					cy += dy, cx += dx;
					ok[cy][cx] = true;
				}
				cy = y2, cx = x2;
				while (check(N, M, cy - dy, cx - dx)) {
					cy -= dy; cx -= dx;
					ok[cy][cx] = true;
				}
			}
		}
	}

	int ans = 0;
	for (int i = 0; i < N; i++) for (int j = 0; j < M; j++) ans += ok[i][j];
	writeln(ans);
}
