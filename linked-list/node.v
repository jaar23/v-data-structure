[heap]
pub struct Node[T] {
mut:
	data T
	next ?&Node[T]
}
