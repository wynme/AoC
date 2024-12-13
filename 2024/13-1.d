module day13_1;

import std;


int solve(int[] a, int[] b, int[] d)
{
	int ans = int.max;
	int[2] r;
	for (int i = 0; i < 100; i++) {
		for (int j = 0; j < 100; j++) {
			r[] = (i * a[]) + (j * b[]);
			if (r == d) ans = min(ans, 3 * i + j);
		}
	}
	return (ans == int.max) ? 0 : ans;
}

void main()
{
	auto r = regex(`(0|[1-9][0-9]*)`);
	int ans = 0;
	while (1) {
		int[] a = matchAll(readln, r).map!(x => x.hit.to!int).array;
		int[] b = matchAll(readln, r).map!(x => x.hit.to!int).array;
		int[] d = matchAll(readln, r).map!(x => x.hit.to!int).array;

		ans += solve(a, b, d);
		if (readln is null) break;
	}

	writeln(ans);
}
