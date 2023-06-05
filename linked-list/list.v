
pub struct List[T] {
mut:
	head ?&Node[T]
	size int
}

pub fn (mut l List[T]) prepend(mut node Node[T]) {
	if head := l.head {
		node.next = head
		l.head = node
		l.size = l.size + 1
	} else {
		l.head = node
		l.size = 1
	}
}

pub fn (mut l List[T]) append(mut node Node[T]) ?int {
	if l.head == none {
		l.head = &node
		l.size = 0
		return l.size
	}

	mut curr_node := l.head
	for {
		if curr_node != none {
			if next_node := curr_node?.next {
				curr_node = next_node
			} else {
				println('expected place')
				curr_node?.next = &node
				l.size = l.size + 1
				break
			}
		}
	}
	return l.size
}

pub fn (l List[T]) find_last() ?&Node[T] {
	mut curr_node := l.head
	for {
		if curr_node != none {
			if next_node := curr_node?.next {
				curr_node = next_node
			} else {
				break
			}
		}
	}
	return curr_node
}

pub fn (l List[T]) find_at(pos int) ?&Node[T] {
	mut curr_node := l.head
	if pos == 0 {
		return curr_node
	}
	if pos > l.size {
		return none
	}
	if pos == l.size {
		l.find_last()
	} 
	for i in 0 .. l.size {
		if i == pos {
			return curr_node
		} else {
			if curr_node != none {
				if next_node := curr_node?.next {
					curr_node = next_node
				} else {
					return none
				}
			}
		}
	}
	return curr_node
}
