module linked_list

import list_node { Node }

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
		l.head = node
		l.size = 1
		return l.size
	}
	mut curr_node := l.head
	for {
		if curr_node != none {
			if next_node := curr_node?.next {
				curr_node = next_node
			} else {
				// println('expected place')
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
	// mut index := 0
	for {
		// println('inside loop')
		if curr_node != none {
			if next_node := curr_node?.next {
				curr_node = next_node
			} else {
				println('found node, its data: ${curr_node?.data}')
				break
			}
		}
		// else {
		// 	println('not found anymore')
		// 	break
		// }
		// index = index + 1
	}
	// println('index: ${index}')
	return curr_node
}

pub fn (l List[T]) find_at(pos int) ?&Node[T] {
	// dump(l.head)
	mut curr_node := l.head
	if pos == 0 {
		return curr_node
	}
	if pos > l.size {
		return none
	}
	if pos == l.size {
		println('last node')
		// dump(l)
		return l.find_last()
	}
	for i in 0 .. l.size {
		println('data: ${curr_node?.data}')
		println('finding ...${i}')
		if i == pos {
			println('found index ${i}')
			return curr_node
		} else {
			if next_node := curr_node?.next {
				curr_node = next_node
			}
		}
	}
	return curr_node
}

pub fn (mut l List[T]) add_after(mut cursor_node Node[T], mut node Node[T]) {
	cursor_node.add_after(mut node)
	l.size = l.size + 1
}

pub fn (mut l List[T]) delete_at(pos int) ?bool {
	mut curr_node := l.head
	mut prev_node := l.head
	if pos == 0 {
		if mut next_node := curr_node?.next {
			println('next_node data: ${next_node.data}')
			l.head = &next_node
			l.size = l.size - 1
			return true
		}
		// following code fail to compile
		// error: cannot convert 'struct _option_main__Node_T_string_ptr' to 'struct main__Node_T_string *'
		// l.head = curr_node?.next
		// l.size = l.size - 1
		// return true
	}
	if pos > l.size {
		return false
	}
	for i in 0 .. l.size {
		if i == pos {
			if mut next_node := curr_node?.next {
				// prev_node?.add_after(mut next_node)
				println('deleting')
				prev_node?.next = next_node
				l.size = l.size - 1
			}
			break
			return true
		} else {
			if curr_node != none {
				if mut next_node := curr_node?.next {
					prev_node = curr_node
					curr_node = &next_node
				} else {
					return false
				}
			}
		}
	}
	return false
}

pub fn (mut l List[T]) destroy() {
	mut cursor_node := l.head
	for _ in 0 .. l.size {
		if mut curr_node := cursor_node {
			if mut next_node := curr_node.next {
				l.head = &next_node
			}
		}
	}
	l.size = 0
	l.head = none
}
