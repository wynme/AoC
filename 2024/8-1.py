from collections import defaultdict


R = defaultdict(list)
G = []
try:
    while line := input():
        G.append(line)
        for i, x in enumerate(G[-1]):
            if x != '.':
                R[x].append((len(G) - 1, i))
except EOFError: pass

N, M = len(G), len(G[0])
anss = set()

def check(i, j):
    return 0 <= i < N and 0 <= j < M

for x in R:
    for y1, x1 in R[x]:
        for y2, x2 in R[x]:
            if (y1, x1) == (y2, x2): continue
            dy, dx = y1 - y2, x1 - x2
            if check(y1 + dy, x1 + dx):
                anss.add((y1 + dy, x1 + dx))
            if check(y2 - dy, x2 - dx):
                anss.add((y2 - dy, x2 - dx))

print(len(anss))
