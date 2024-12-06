module day6_1;

import std;


void main()
{
	string[] G;
	string line;
	while ((line = readln) !is null) G ~= line;

	ulong N = G.length, M = G[0].length;
	int[] pos;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			if (G[i][j] == '^') pos = [i, j];
		}
	}

	int[][] vs = [[-1, 0], [0, 1], [1, 0], [0, -1]];
	int[][] ps = new int[][](N, M);
	for (int i = 0; i < N; i++) for (int j = 0; j < M; j++) ps[i][j] = -1;

	int unique = 0, loops = 0, c = 0;
	while (true) {
		int y = pos[0], x = pos[1];
		// Assumption
		if (y == -1 || y == N || x == -1 || x == M || ps[y][x] == c) break;
		if (G[y][x] == '#') {
			pos[] += -vs[c++ % 4][] + vs[c % 4][];
			continue;
		}
		unique += ps[y][x] == -1;
		ps[y][x] = c;
		pos[] += vs[c % 4][];
	}

	writeln(unique);
}
