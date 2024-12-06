G = []
try:
    while (l := input()): G.append(list(l))
except EOFError: pass

N, M = len(G), len(G[0])
for i in range(N):
    for j in range(M):
        if G[i][j] == '^': pos = (i, j)

def get_path(pos):
    vs = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    c = 0
    path = set()
    y, x = pos

    while True:
        if (y, x, c) in path: return path, True
        path.add((y, x, c))
        dy, dx = vs[c]
        ny, nx = y + dy, x + dx
        if not (0 <= ny < N and 0 <= nx < M): return path, False
        if G[ny][nx] == '#':
            c = (c + 1) % 4
        else:
            y, x = ny, nx

path, _ = get_path(pos)
anss = set()
for y, x, _ in path:
    if pos == (y, x): continue
    G[y][x] = '#'
    _, is_path = get_path(pos)
    if is_path:
        anss.add((y, x))
    G[y][x] = '.'
print(len(anss))
