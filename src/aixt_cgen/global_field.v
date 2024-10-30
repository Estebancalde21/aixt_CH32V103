// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2023-2024
// License: MIT
module aixt_cgen

import v.ast

// global_field is the code generation function for global fields.
fn (mut gen Gen) global_field(node ast.GlobalField) []string {
	// println(node)
	mut out := []string{}
	var_kind := gen.table.type_kind(
		if node.typ >= 0x10000 {	// reference variable
			node.typ - 0x10000
		} else {	// regular variable
			node.typ
		}).str()
	ref := if node.typ >= 0x10000 {	// reference variable
			'*'		
		} else {	// regular variable
			''	
		}
	var_name := node.name.replace('.', '__')
	expr := node.expr
	match expr {
		ast.EmptyExpr {
			len := ''
			var_c_type := if !var_kind.contains('.') {
				gen.setup.compiler_types[var_kind]
			} else {
				var_kind
			}	
			if var_c_type == 'char []' {
				out << $tmpl('c_templates/decl_string_fixed.tmpl.c')
			} else {
				out << $tmpl('c_templates/decl.tmpl.c')
			}
		}
		ast.CastExpr {
			var_value := gen.ast_node((node.expr as ast.CastExpr).expr).join('')
			var_c_type := if !var_kind.contains('.') {
				gen.setup.compiler_types[var_kind]
			} else {
				var_kind
			}
			if var_c_type == 'char []' {
				len := ''
				out << $tmpl('c_templates/decl_assign_string.tmpl.c')
			} else {
				out << $tmpl('c_templates/decl_assign.tmpl.c')
			}								
		}
		ast.ArrayInit {
			array_init := (node.expr as ast.ArrayInit)
			var_type:= gen.table.type_kind(array_init.elem_type).str()
			var_c_type := if !var_type.contains('.') {
				gen.setup.compiler_types[var_type]
			} else {
				var_type
			}
			len := array_init.exprs.len
			var_value := gen.ast_node(node.expr).join('')
			if array_init.is_fixed {
				out << $tmpl('c_templates/decl_assign_array_fixed.tmpl.c')
			} else {
				out << $tmpl('c_templates/decl_assign_array.tmpl.c')
			}
		}
		else {
			var_value := gen.ast_node(node.expr).join('')
			var_c_type := if !var_kind.contains('.') {
				gen.setup.compiler_types[var_kind]
			} else {
				var_kind
			}
			if var_c_type == 'char []' {
				len := ''
				out << $tmpl('c_templates/decl_assign_string.tmpl.c')
			} else {
				out << $tmpl('c_templates/decl_assign.tmpl.c')
			}
		}
	}
	return out
}