#include <bits/stdc++.h>

using namespace std;


int main(void)
{
	int N = 1000;
	vector<int> A(N), B(N);
	for (int i = 0; i < N; i++) {
		cin >> A[i] >> B[i];
	}

	map<int, int> C;
	for (int i = 0; i < N; i++) {
		C[B[i]]++;
	}

	int ans = 0;
	for (int i = 0; i < N; i++) {
		ans += A[i] * C[A[i]];
	}
	cout << ans << '\n';
	return EXIT_SUCCESS;
}
