module day2;

import std;


void main()
{
	int paper = 0, ribbon = 0;
	string line;
	while ((line = readln.chomp) !is null) {
		auto k = line.split('x').to!(int[]);
		paper += 2 * (k[0] * k[1] + k[1] * k[2] + k[2] * k[0]);
		paper += min(k[0] * k[1], k[1] * k[2], k[2] * k[0]);
		ribbon += 2 * min(k[0] + k[1], k[1] + k[2], k[2] + k[0]);
		ribbon += k.fold!((a, b) => a * b);
	}
	writeln(paper);
	writeln(ribbon);
}
