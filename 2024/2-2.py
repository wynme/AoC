import typing

def safe(N: int, A: list[int]) -> bool:
    B = set(A[i] - A[i - 1] for i in range(1, N))
    return all(x in (1, 2, 3) for x in B) or all(x in (-1, -2, -3) for x in B)


ans = 0
for _ in range(1000):
    A = [int(x) for x in input().split()]
    N = len(A)
    ans += safe(N, A) or any(safe(N - 1, A[:i] + A[i + 1:]) for i in range(N))

print(ans)
