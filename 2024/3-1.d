// Necessary for compilation
module day3_1;

import std;
import std.array : split;


void main()
{
	string line;
	auto r = regex(`mul\((0|[1-9][0-9]*),(0|[1-9][0-9]*)\)`);
	long ans = 0;
	while ((line = readln()) !is null) {
		foreach (c; matchAll(line, r)) {
			int[] h = c.hit[4 .. $ - 1].split(',').to!(int[]);
			ans += h[0] * h[1];
		}
	}
	writeln(ans);
}
