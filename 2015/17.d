module day17;

import std;
import core.bitop : popcnt;


void main()
{
	int K = 150;
	int[] A;
	string line;
	while ((line = readln.chomp) !is null) {
		A ~= line.to!int;
	}

	int N = cast(int)A.length;
	int[] C = new int[N + 1];
	int p1 = 0;
	for (int bits = 0; bits < (1 << N); bits++) {
		int c = 0;
		for (int e = 0; e < N; e++) {
			if (bits & (1 << e)) c += A[e];
		}
		p1 += c == K;
		C[popcnt(bits)] += c == K;
	}

	writeln(p1);
	foreach (x; C) {
		if (x) { writeln(x); break; }
	}
}
