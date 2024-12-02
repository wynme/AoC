ans = 0
for _ in range(1000):
    A = [int(x) for x in input().split()]
    N = len(A)
    if A != list(sorted(A)) and A != list(reversed(sorted(A))):
        continue

    ok = True
    for i in range(1, N):
        if not 1 <= abs(A[i] - A[i - 1]) <= 3:
            ok = False
    ans += ok
print(ans)
