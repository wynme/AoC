from collections import defaultdict

G = []
try:
    while line := input(): G.append(line)
except EOFError: pass

N, M = len(G), len(G[0])
D = ((1, 0), (-1, 0), (0, 1), (0, -1))
went = set()
squares = set()

def valid(y, x): return 0 <= y < N and 0 <= x < M
def get_open(y, x): 
    c = 0
    r = set()
    for dy, dx in D:
        ny, nx = y + dy, x + dx
        if not valid(ny, nx) or G[ny][nx] != G[y][x]: r.add((dy, dx))
    return r

# Count with overlap
def acclap(v, y, x, open):
    if v in ((1, 0), (-1, 0)): ck = ((0, 1), (0, -1))
    else: ck = ((1, 0), (-1, 0))

    c = 1
    for dy, dx in ck:
        if v in open[(y + dy, x + dx)]: c -= 1
    return c


def dfs(y, x):
    went.add((y, x))
    squares.add((y, x))

    c, p = 1, 0
    open = defaultdict(set)
    open[(y, x)] = get_open(y, x)
    for dy, dx in D:
        if (dy, dx) in open[(y, x)]: continue
        if (ny := y + dy, nx := x + dx) not in went:
            if valid(ny, nx) and G[ny][nx] == G[y][x]:
                d, q, o = dfs(ny, nx)
                c, p = c + d, p + q
                # Prevent overwriting by defaultdict initialized
                open = o | open

    for v in open[(y, x)]:
        p += acclap(v, y, x, open)

    return c, p, open
            
    
ans = 0
area, sides = 0, 0
for i in range(N):
    for j in range(M):
        if (i, j) not in went:
            area, sides, _ = dfs(i, j)
            ans += area * sides
print(ans)
