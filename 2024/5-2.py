from collections import defaultdict

R = defaultdict(set)
while line := input():
    a, b = (int(x) for x in line.split('|'))
    R[a].add(b)

ans = 0
try:
    while line := input():
        A = [int(x) for x in line.split(',')]
        S = set(A)
        B = sorted(A, key=lambda x: -len([y for y in R[x] if y in S]))
        if A != B:
            ans += B[len(B) // 2]

except EOFError:
    print(ans)
