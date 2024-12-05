module day5_1;

import std;


void main()
{
	string line;
	int[][] rules;
	while ((line = readln.chomp) != "") {
		rules ~= line.split("|").to!(int[]);
	}

	int ans = 0;
	while ((line = readln.chomp) !is null) {
		int[] A = line.split(",").to!(int[]);		

		int[int] M;
		foreach(i, x; A) {
			M[x] = i.to!int;
		}

		bool ok = true;
		foreach(r; rules) {
			int a = M.get(r[0], -1), b = M.get(r[1], -1);
			if (a != -1 && b != -1 && a > b) {
				ok = false;
				break;
			}
		}
		
		if (ok) {
			ans += A[$ / 2];
		} 
	}

	writeln(ans);
}
