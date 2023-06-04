
pub struct List[T] {
  mut: 
		head &Node[T] = unsafe { nil }
	  size int
}

pub fn (mut l List[T]) prepend(node &Node[T]) {
	unsafe {
		if l.head == nil {
		  l.head = node
		} 
  }
}
