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
<td>null_program.pt</td>
<td>Ensure handling of programs is fairly unchanged compared to PT Pascal</td>
<td>Program with no body</td>
<td>null_program.pt.eOutput</td><td></td>
</tr>

<tr>
<td>constant_block_positive.pt</td>
<td>Ensure block can handle a single integer constant declaration</td>
<td>Declares an integer constant</td>
<td>constant_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>multiconstant_block_positive.pt</td>
<td>Ensure block can handle a multiple integer constant declarations</td>
<td>Declares 2 integer constant</td>
<td>multiconstant_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>ifstmt_block_positive.pt</td>
<td>Ensures block can handle if statement</td>
<td>Declares two integer constants, runs an if statement to assign value to a constant</td>
<td>ifstmt_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>ifstmt_output_block_positive.pt</td>
<td>Ensures program can output correct integer</td>
<td>Declares two integer constants, runs an if statement to assign value to a constant and outputs the constant's value</td>
<td>ifstmt_output_block_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole6.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole7.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole8.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole9.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole10.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole11.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole12.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole13.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole14.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole15.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole16.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole17.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole18.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole19.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole20.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole21.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole22.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole23.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole24.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
</tr>

<tr>
<td>Nicole25.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>fileName.pt.eOutput</td><td></td>
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