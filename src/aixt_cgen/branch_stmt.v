// Project Name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2023-2024
// License: MIT
module aixt_cgen

import v.ast

// branch_stmt is the code generation function for branch statements.
fn (mut gen Gen) branch_stmt(node ast.BranchStmt) []string {
	// println('>>>>>>>>>>>>>>>>>> ${node} <<<<<<<<<<<<<<<<<<')
	return ['${node.str()};']
}