module day13_2;

import std;


long solve(long x1, long y1, long x2, long y2, long xd, long yd)
{
	long b = (x1 * yd - y1 * xd) / (x1 * y2 - x2 * y1);
	long a = (x2 * yd - y2 * xd) / (x2 * y1 - x1 * y2);
	if (a * x1 + b * x2 == xd && a * y1 + b * y2 == yd) {
		return 3 * cast(long)a + cast(long)b;
	} return 0;
}

void main()
{
	auto r = regex("(0|[1-9][0-9]*)");
	long ans = 0;
	long R = 10000000000000;
	while (1) {
		long[] a = matchAll(readln, r).map!(x => x.hit.to!long).array;
		long[] b = matchAll(readln, r).map!(x => x.hit.to!long).array;
		long[] d = matchAll(readln, r).map!(x => x.hit.to!long).array;
		d[] += R;

		ans += solve(a[0], a[1], b[0], b[1], d[0], d[1]);
		if (readln is null) break;
	}

	writeln(ans);
}
