module main

import linked_list { List }
import node { Node }
import os { input }

fn main() {
	mut list := List[string]{}
	list.append(mut Node{ data: '2' })
	list.prepend(mut Node{ data: '1' })
	list.prepend(mut Node{ data: '0' })
	list.append(mut Node{ data: '3' }) or { panic('unable to append linked list') }
	list.append(mut Node{ data: '4' }) or { panic('unable to append linked list') }
	dump(list)
	mut last := list.find_last() or { panic('unable to find last node') }
	dump(last)
	list.add_after(mut last, mut Node{ data: '5' })
	n := input('Search for position: ')
	println('Position: ${n}!')
	found := list.find_at(n.int())
	dump(found)
	dump(list)
	deleted := list.delete_at(6) or { panic('unable to delete node') }
	if !deleted {
		println('nothing is deleted')
	}
	println('destroy the list')
	list.destroy()
	dump(list)
}
