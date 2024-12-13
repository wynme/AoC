module day3;

import std;


void main()
{
	int[2][char] D = [
		'^': [1, 0], 'v': [-1, 0], '<': [0, -1], '>': [0, 1]
	];
	bool[int[2]] p1;
	int[2] pos = [0, 0];
	p1[pos] = true;

	bool[int[2]] p2;
	int[2] santa = [0, 0], robo = [0, 0];
	p2[santa] = p2[robo] = true;
	int c = 0;
	string line;
	while ((line = readln.chomp) !is null) {
		foreach (ch; line) {
			pos[] += D[ch][];
			p1[pos] = true;

			if (c % 2 == 0) santa[] += D[ch][];
			else robo[] += D[ch][];
			p2[santa] = p2[robo] = true;
			c++;
		}
	}

	writeln(p1.length);
	writeln(p2.length);
}
