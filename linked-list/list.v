
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
	if h := l.head {
		h
	} else {
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
		} else {
			// println('unexpected place')
			// curr_node = &node
			// l.size = l.size + 1
			// break
		}
	}
	return l.size
}

// fn (l List[T]) find_next(node ?&Node[T]) ?&Node[T] {
//	dump(node)
//	if n := node {
//		return l.find_next(n)
//	} else {
//		return none
//	}
//}
