import os { input }

fn main() {
	name := input('Enter your name: ')
	println('Hello, ${name}!')
	mut list := List[string]{}
	list.prepend(mut Node{ data: name })
	list.prepend(mut Node{ data: 'first' })
	list.append(mut Node{ data: 'last' }) or { panic('unable to append linked list') }
	list.append(mut Node{ data: 'very last' }) or { panic('unable to append linked list') }
	dump(list)
	// println(add(1, 2))
}
