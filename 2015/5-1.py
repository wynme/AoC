from collections import Counter

ans = 0
try:
    while S := input():
        N = len(S)
        C = Counter(S)
        ans += sum(C[x] for x in "aeiou") >= 3 \
                and any(S[i] == S[i + 1] for i in range(N - 1)) \
                and all(x not in S for x in ("ab", "cd", "pq", "xy"))
except EOFError:
    print(ans)
