# Test Descriptions

## Justification for Completeness

## Test Description Table

<table>
<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output Filename</th>
<th>Notes</th>
</tr>

<tr>
<td>5_packages_positive.pt</td>
<td>Tests the behaviour when vars and vals are declared as public within a package and then accessed outside of the package</td>
<td>Declares public vars and vals within a package and accesses them outisde the packages scope</td>
<td>5_packages_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>5_package_negative_noPkgName.pt</td>
<td>Tests the behaviour when a package is declared with no name</td>
<td>A package with no declared name containing a declared function, val and var</td>
<td>5_package_negative_noPkgName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>5_package_negative_noPkgEnd.pt</td>
<td>Tests the behaviour when a package is declared with no terminating end statement</td>
<td>A package with no end statement containing a declared function, val and var</td>
<td>5_package_negative_noPkgEnd.pt.eOutput</td><td></td>
</tr>

<tr>
<td>5_package_negative_noPublicAccess.pt</td>
<td>Tests the behaviour when a var in a package is not declared public and accessed outside the package</td>
<td>A package containing a non-public val, followed by an atempt to access this val from outside the package</td>
<td>5_package_negative_noPublicAccess.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex5.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex6.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex7.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex8.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex9.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex10.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex11.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex12.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex13.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex14.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex15.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex16.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex17.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex18.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex19.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex20.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex21.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex22.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex23.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex24.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Alex25.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_array_bounds_bad_range_neg.pt</td>
<td>Test behaviour when array bound < 1 specified</td>
<td>Declares an array of integer with arrayBound 0</td>
<td>3_array_bounds_bad_range_neg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_array_bounds_bad_type_neg.pt</td>
<td>Test behaviour when non-tpInteger constant specified as array bounds</td>
<td>Declares an array of integer with arrayBound of type string</td>
<td>3_array_bounds_bad_type_neg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_array_bounds_non_const_neg.pt</td>
<td>Test behaviour when non-const variable_identifier specified as arrayBound</td>
<td>Declares array of integer with a 'var' arrayBound</td>
<td>3_array_bounds_non_const_neg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_array_bounds_positive.pt</td>
<td>Test behaviour of properly declared arrays</td>
<td>Declares some arrays of various types and lengths, using constants and literal values</td>
<td>3_array_bounds_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_functions_non_scalar_neg.pt</td>
<td>Test behaviour of value parameter when type is non-scalar</td>
<td>Defines an array 'arr', then declares a function with value param to be 'like arr'</td>
<td>3_functions_non_scalar_neg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_functions_positive.pt</td>
<td>Test behaviour of functions with properly declared value and reference parameters</td>
<td>Declares first function with value params, then second function with reference params</td>
<td>3_functions_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_var_declaration_positive.pt</td>
<td>Test behaviour of properly declared variables using like clause on literals</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_var_declaration_bad_ident_neg.pt</td>
<td>Test behaviour when type mismatch present in like clause</td>
<td>Declares a string val 'str', then a var to be 'like -str'</td>
<td>3_var_declaration_bad_ident_neg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>3_var_declaration_undef_ident_neg.pt</td>
<td>Test behaviour when undefined identifier used in like clause</td>
<td>Declares a var to be 'like b', where 'b' is an undefined identifier</td>
<td>3_var_declaration_undef_ident_neg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared10.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared11.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared12.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared13.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared14.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared15.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared16.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared17.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared18.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared19.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared20.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared21.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared22.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared23.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared24.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Jared25.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>1_null_program.pt</td>
<td>Ensure handling of programs is fairly unchanged compared to PT Pascal</td>
<td>Program with no body</td>
<td>1_null_program.pt.eOutput</td><td></td>
</tr>

<tr>
<td>2_constant_block_positive.pt</td>
<td>Ensure block can handle a single integer constant declaration</td>
<td>Declares an integer constant</td>
<td>2_constant_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>2_multiconstant_block_positive.pt</td>
<td>Ensure block can handle a multiple integer constant declarations</td>
<td>Declares 2 integer constant</td>
<td>2_multiconstant_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>2_ifstmt_block_positive.pt</td>
<td>Ensures block can handle if statement</td>
<td>Declares two integer constants, runs an if statement to assign value to a constant</td>
<td>2_ifstmt_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>2_ifstmt_output_block_positive.pt</td>
<td>Ensures program can output correct integer</td>
<td>Declares two integer constants, runs an if statement to assign value to a constant and outputs the constant's value</td>
<td>2_ifstmt_output_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_ifnoelse_positive.pt</td>
<td>Test behaviour of one if statement</td>
<td>Runs a single if statement</td>
<td>6_ifnoelse_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_ifelse_positive.pt</td>
<td>Test behaviour of if-else statement</td>
<td>Runs an if statement followed by an else statement</td>
<td>6_ifelse_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_elseif_positive.pt</td>
<td>Test behaviour of elseif statement</td>
<td>Runs an if-elseif chain then an equivalent nested if statement</td>
<td>6_elseif_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_chained_elseif_positive.pt</td>
<td>Test behaviour of multiple elseif statements</td>
<td>Runs an if statement and multiple elseif statements</td>
<td>6_chained_elseif_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_else_positive.pt</td>
<td>Test use of optional else following elseif chain</td>
<td>Runs an if statement, multip</td>
<td>6_else_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_elseif_negative.pt</td>
<td>Test elseif preceding if</td>
<td>Runs an elseif statement on its own</td>
<td>6_elseif_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_else_negative.pt</td>
<td>Test else preceding with no if</td>
<td>Runs an else statement on its own</td>
<td>6_else_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_if_noend_negative.pt</td>
<td>Test behaviour when if statement not terminated</td>
<td>Runs a single if statement without an end</td>
<td>6_if_noend_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_ifchain_noend_negative.pt</td>
<td>Test behaviour of mismatched if statements and ends</td>
<td>Runs a chain of if statements with only an end after the last one</td>
<td>6_ifchain_noend_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_elseif_noend_negative.pt</td>
<td>Test behaviour when if-elseif not terminated</td>
<td>Runs an if and elseif statement with no end</td>
<td>6_elseif_noend_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_ifelse_noend_negative.pt</td>
<td>Test behaviour of if-else statement that is not terminated</td>
<td>Runs an if and else statement with no end</td>
<td>6_ifelse_noend_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_ifthen_negative.pt</td>
<td>Test behaviour for missing then</td>
<td>Runs an if statement with no then</td>
<td>6_ifthen_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_elseifthen_negative.pt</td>
<td>Test behaviour for missing then</td>
<td>Runs an if and elseif statement with no then</td>
<td>6_elseifthen_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_multiple_else_negative.pt</td>
<td>Test behaviour with more than one else statement</td>
<td>Runs an if followed by multiple else statements</td>
<td>6_multiple_else_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_choose_negative_misplaced_then.pt</td>
<td>Test behaviour of a choose statement lacking 'then' following 'when ...' or unneeded 'then' following 'else'</td>
<td>Choose statement with no then after 'when', and extra 'then' following 'else'</td>
<td>6_choose_negative_misplaced_then.pt.eOutput</td>
</tr>

<tr>
<td>6_choose_negative_no_cases.pt</td>
<td>Test behaviour of a choose statement without any cases</td>
<td>Choose statement without any 'when' cases in body</td>
<td>6_choose_negative_no_cases.pt.eOutput</td>
</tr>

<tr>
<td>6_choose_negative_no_end.pt</td>
<td>Test behaviour of choose statement with no 'end;' terminating the statement</td>
<td>A choose statement with a single 'when' case and nothing following (i.e. pEndFile)</td>
<td>6_choose_negative_no_end.pt.eOutput</td>
</tr>

<tr>
<td>6_choose_negative_no_expression.pt</td>
<td>Test behaviour of choose statement without an expression following 'choose'</td>
<td>Choose statement with no expression or 'of' following 'choose', followed by multiple 'when' cases</td>
<td>6_choose_negative_no_expression.pt.eOutput</td>
</tr>

<tr>
<td>6_choose_negative_when_outside_choose.pt</td>
<td>Test behaviour of a 'when' clause outside of a choose statement</td>
<td>A when statement that isn't inside a choose</td>
<td>6_choose_negative_when_outside_choose.pt.eOutput</td>
</tr>

<tr>
<td>6_choose_positive.pt</td>
<td>Test behaviour of valid choose statements, with or without default case</td>
<td>Two choose statements: first with multiple 'when' and an 'else', second with a single 'when'</td>
<td>6_choose_positive.pt.eOutput</td>
</tr>

<tr>
<td>Travis1.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis2.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis3.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis4.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis5.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis6.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis7.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis8.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis9.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis10.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis11.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis12.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis13.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis14.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis15.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis16.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis17.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis18.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis19.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis20.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis21.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis22.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis23.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis24.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Travis25.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

</table>