# menus
$env.config.menus = [
{
	name: completion_menu
	only_buffer_difference: false
	marker: "| "
	type: {
		layout: columnar
		columns: 4
		col_width: 20
		col_padding: 2
	}
	style: {
		text: green
		selected_text: green_reverse
		description_text: yellow
	}
}
{
	name: history_menu
	only_buffer_difference: true
	marker: "? "
	type: {
		layout: list
		page_size: 10
	}
	style: {
		text: green
		selected_text: green_reverse
		description_text: yellow
	}
}
{
	name: help_menu
	only_buffer_difference: true
	marker: "? "
	type: {
		layout: description
		columns: 4
		col_width: 20
		col_padding: 2
		selection_rows: 4
		description_rows: 10
	}
	style: {
		text: green
		selected_text: green_reverse
		description_text: yellow
	}
}
{
	name: commands_menu
	only_buffer_difference: false
	marker: "# "
	type: {
		layout: columnar
		columns: 4
		col_width: 20
		col_padding: 2
	}
	style: {
		text: green
		selected_text: green_reverse
		description_text: yellow
	}
	source: { |buffer, position|
		$nu.scope.commands
		| where name =~ $buffer
		| each { |it| {value: $it.name description: $it.usage} }
	}
}
{
	name: vars_menu
	only_buffer_difference: true
	marker: "# "
	type: {
		layout: list
		page_size: 10
	}
	style: {
		text: green
		selected_text: green_reverse
		description_text: yellow
	}
	source: { |buffer, position|
		$nu.scope.vars
		| where name =~ $buffer
		| sort-by name
		| each { |it| {value: $it.name description: $it.type} }
	}
}
{
	name: commands_with_description
	only_buffer_difference: true
	marker: "# "
	type: {
		layout: description
		columns: 4
		col_width: 20
		col_padding: 2
		selection_rows: 4
		description_rows: 10
	}
	style: {
		text: green
		selected_text: green_reverse
		description_text: yellow
	}
	source: { |buffer, position|
		$nu.scope.commands
		| where name =~ $buffer
		| each { |it| {value: $it.name description: $it.usage} }
	}
}]