module main

import linked_list { List }
import list_node { Node }
import time

fn main() {
	// mut list := List[string]{}
	// list.append(mut Node{ data: '2' })
	// list.prepend(mut Node{ data: '1' })
	// list.prepend(mut Node{ data: '0' })
	// list.append(mut Node{ data: '3' }) or { panic('unable to append linked list') }
	// list.append(mut Node{ data: '4' }) or { panic('unable to append linked list') }
	// dump(list)
	// mut last := list.find_last() or { panic('unable to find last node') }
	// dump(last)
	// list.add_after(mut last, mut Node{ data: '5' })
	// n := input('Search for position: ')
	// println('Position: ${n}!')
	// found := list.find_at(n.int())
	// dump(found)
	// dump(list)
	// deleted := list.delete_at(6) or { panic('unable to delete node') }
	// if !deleted {
	// 	println('nothing is deleted')
	// }
	// println('destroy the list')
	// list.destroy()
	// dump(list)
	mut now := time.now()
	mut list := List[string]{}
	// i := 1
	for i in 0 .. 10000 {
		mut node := Node[string]{
			data: i.str()
		}
		dump(node)
		list.append(mut node)
	}
	println('spent ${time.since(now)} to init..')
	// dump(list)
	// list.prepend(mut Node{ data: 'other..' + i.str() })
	now = time.now()
	found := list.find_at(10000)
	dump(found)
	println('size: ${list.size}')
	println('spent ${time.since(now)} to search')
	// println('done')
	// for i in 0 .. 10 {
	// println(i)
	// }
}
