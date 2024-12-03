module task3_2;

import std;
import std.array : split;


void main()
{
	string line;
	auto rs = regex([`mul\((0|[1-9][0-9]*),(0|[1-9][0-9]*)\)`, `don't\(\)`, `do\(\)`]);
	bool match = true;
	long ans = 0;
	while ((line = readln()) !is null) {
		foreach (c; matchAll(line, rs)) {
			if (c.hit == "don't()") {
				match = false;
			} else if (c.hit == "do()") {
				match = true;
			} else if (match) {
				int[] h = c.hit[4 .. $ - 1].split(',').to!(int[]);
				ans += h[0] * h[1];
			}
		}
	}
	writeln(ans);
}

