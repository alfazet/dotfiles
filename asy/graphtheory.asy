real PI = 3.14159;

struct Node {
  pair pos;
  string l;

  void operator init(pair pos, string l = "") {
    this.pos = pos;
    this.l =  l;
  }

  void draw_node(pen color = black) {
    if (this.l == "") {
      dot(this.pos, color + linewidth(8));
    } else {
      draw(circle(this.pos, 0.5), color);
      label(this.pos, this.l, color);
    }
  }
}

struct Edge {
  Node u, v;
  int deg_u, deg_v;
  bool dir;
  string l;

  void operator init(Node u, Node v, int deg_u = 0, int deg_v = 180, bool dir = false, string l = "") {
    this.u = u;
    this.v = v;
    this.deg_u = deg_u;
    this.deg_v = deg_v;
    this.dir = dir;
    this.l = l;
  }

  void draw_edge(pen color = black) {
    real dir_u = this.deg_u / 180.0 * PI;
    real dir_v = this.deg_v / 180.0 * PI;
    pair d_u = (cos(dir_u), sin(dir_u)) * 0.5;
    pair d_v = (cos(dir_v), sin(dir_v)) * 0.5;
    arrowbar arrow = None;
    if (this.dir) {
      arrow = Arrow;
    }
    draw((this.u.pos + d_u) -- (this.v.pos + d_v), color, arrow=arrow);
  }
}

struct Graph {
  Node[] nodes;
  Edge[] edges;

  void add_node(pair pos, string l = "") {
    this.nodes.push(Node(pos, l));
  }

  void add_edge(int u, int v, int deg_u, int deg_v, bool dir = false, string l = "") {
    this.edges.push(Edge(this.nodes[u], this.nodes[v], deg_u, deg_v, dir, l));
  }

  void draw_graph(pen color = black) {
    for (Node v : this.nodes) {
      v.draw_node(color);
    }
    for (Edge e : this.edges) {
      e.draw_edge(color);
    }
  }
}
