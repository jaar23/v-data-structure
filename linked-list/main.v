import os { input }

fn main() {
	name := input('Enter your name: ')
	println('Hello, ${name}!')
	mut list := List[string]{}
	list.prepend(Node {data: name})
	dump(list)
	println(add(1, 2))
}


