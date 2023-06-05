import os { input }

fn main() {
	mut list := List[string]{}
	list.append(mut Node{ data: '2' })
	list.prepend(mut Node{ data: '1' })
	list.prepend(mut Node{ data: '0' })
	list.append(mut Node{ data: '3' }) or { panic('unable to append linked list') }
	list.append(mut Node{ data: '4' }) or { panic('unable to append linked list') }
	dump(list)
	last := list.find_last()
	dump(last)
	n := input('Search for position: ')
	println('Position: ${n}!')
	found := list.find_at(n.int())
	dump(found)
	dump(list)
}
