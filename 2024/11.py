import typing
import functools

@functools.cache
def sim(x: int, c: int) -> int:
    if c == 0: return 1
    if x == 0: return sim(1, c - 1)
    if (n := len(s := str(x))) % 2 == 0:
        return sim(int(s[:n // 2]), c - 1) + sim(int(s[n // 2:]), c - 1)
    return sim(x * 2024, c - 1)

A = [int(x) for x in input().split()]
print(sum(sim(x, 25) for x in A))
print(sum(sim(x, 75) for x in A))
