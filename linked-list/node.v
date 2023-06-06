module list_node

[heap]
pub struct Node[T] {
pub mut:
	data T
	next ?&Node[T]
}

pub fn (mut n Node[T]) add_after(mut node Node[T]) {
	if next_node := n.next {
		node.next = next_node
	}
	n.next = &node
}
