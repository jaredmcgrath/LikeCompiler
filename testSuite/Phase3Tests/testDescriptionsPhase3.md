# Test Descriptions

## Previous Phase Tests

Some or all of the tests written during Phase 2 are relevant and necessary to test language features developed during Phase 3. For this reason, we have modified the `test-phase.sh` and `generate-test-output.sh` scripts to execute all the tests located in `Phase2Tests/` using the semantic phase of our compiler. The program source for each Phase 2 test will remain in `Phase2Tests/`, however, our expected output will be located here in `Phase3Tests/phase2_eOutput/`. Most importantly, a revised `testDescriptionsPhase2.md` is located here to note any differences in test descriptions/expected output from Phase 2 (i.e. they are __NOT__ listed in this file).

_TL;DR_: Phase 2 tests are Phase 3 tests. They will be described in `Phase3Tests/testDescriptionsPhase2.md`. Their semantic phase expected output is in `Phase3Tests/phase2_eOutput/`. Test program source remains (unmodified) in `Phase2Tests/`.

## Justification for Completeness

## Test Description Table

__Note__: All line numbers referenced in the following table are referring their respective test files.

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
<td>Declares a public var and public val within a package and accesses them outisde the package's scope</td>
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
<td>5_package_positive_funInsidePkg.pt</td>
<td>Tests the behaviour when a public function is declared inside a package and then accessed outisde</td>
<td>A package containing a public function, followed by an attempt to access the function</td>
<td>5_package_positive_funInsidePkg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>5_package_negative_funInsidePkg.pt</td>
<td>Tests the behaviour when a private function is declared inside a package and then accessed outisde</td>
<td>A package containing a private function, followed by an attempt to access the function</td>
<td>5_package_negative_funInsidePkg.pt.eOutput</td><td></td>
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
<td>3_var_declaration_multi_neg.pt</td>
<td>Ensure multiple variable declarations cannot exist on same line</td>
<td>Attempts to declare two vars on the same line</td>
<td>3_var_declaration_multi_neg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>4_init_arr_neg.pt</td>
<td>Ensure var declaration with initial value tpArray is invalid</td>
<td>Declares an array, then declares a var with initial value of the declared array</td>
<td>4_init_arr_neg.pt.eOutput</td>
<td>Error @ 5: inital val cannot be array (eScalarReqd)</td>
</tr>

<tr>
<td>4_init_bool_positive.pt</td>
<td>Ensure var declaration with initial value tpBoolean is valid</td>
<td>Declares an var with initial value true</td>
<td>4_init_bool_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>4_init_expression_positive.pt</td>
<td>Ensure initial value assigned is of proper type for all possible expressions</td>
<td>One variable declaration for each unary and binary operation</td>
<td>4_init_expression_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>4_init_file_positive.pt</td>
<td>Ensure var declaration with initial value tpFile is valid</td>
<td>Declares an var with initial value output</td>
<td>4_init_file_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>4_init_int_positive.pt</td>
<td>Ensure var declaration with initial value tpInteger is valid</td>
<td>Declares an var with initial value 1</td>
<td>4_init_int_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>4_init_positive.pt</td>
<td>Ensure var declaration with misc. values are valid</td>
<td>Declares variables with various initial values</td>
<td>4_init_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>4_init_str_positive.pt</td>
<td>Ensure var declaration with initial value tpChar is valid</td>
<td>Declares an var with initial value of a string</td>
<td>4_init_str_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_concat_neg.pt</td>
<td>Ensure string concatenation operator fails for operands of bad types</td>
<td>Tries to string concat between integers</td>
<td>8_concat_neg.pt.eOutput</td>
<td>Error @ 3-5: type clashes (eTypeMismatch)</td>
</tr>

<tr>
<td>8_concat_positive.pt</td>
<td>Ensure string concatenation between strings works</td>
<td>Expression with string concatenation of two strings</td>
<td>8_concat_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_concat_result_positive.pt</td>
<td>Ensure result of string concatenation is a string</td>
<td>Perform string concat, then store result in a tpChar variable</td>
<td>8_concat_result_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_equality_neg.pt</td>
<td>Ensure string equality operator fails between tpChar and non-tpChar</td>
<td>Perform equality comparison between tpChar and tpInteger</td>
<td>8_equality_neg.pt.eOutput</td>
<td>Error @ 3: operand and operator types clash (eOperandOperatorTypeMismatch)</td>
</tr>

<tr>
<td>8_equality_positive.pt</td>
<td>Ensure string equality operator works between tpChar (and tStringEQ emitted)</td>
<td>Perform equality operator between two tpChars</td>
<td>8_equality_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_inequality_neg.pt</td>
<td>Ensure string inequality operator fails between tpChar and non-tpChar</td>
<td>Perform inequality comparison between tpChar and tpInteger</td>
<td>8_inequality_neg.pt.eOutput</td>
<td>Error @ 3: operand and operator types clash (eOperandOperatorTypeMismatch)</td>
</tr>

<tr>
<td>8_inequality_positive.pt</td>
<td>Ensure string equality operator works between tpChar (and tStringEQ, tNot emitted)</td>
<td>Perform inequality operator between two tpChars</td>
<td>8_inequality_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_repeat_neg.pt</td>
<td>Ensure string repeat operator fails for operands of bad types</td>
<td>Perform repeat when 1st operand is not tpChar, 2nd is not tpInteger</td>
<td>8_repeat_neg.pt.eOutput</td>
<td>Error @ 3-5: operand and operator types clash (eOperandOperatorTypeMismatch)</td>
</tr>

<tr>
<td>8_repeat_positive.pt</td>
<td>Ensure string repeat with operands tpChar, tpInteger works</td>
<td>Expression involving string repeat with properly typed operands</td>
<td>8_repeat_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_repeat_result_positive.pt</td>
<td>Ensure result of string repeat is also a tpChar</td>
<td>Perform string repeat, then store result in a tpChar variable</td>
<td>8_repeat_result_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_str_relational_neg.pt</td>
<td>Ensure that strings cant be used in relational comparison operators</td>
<td>Expressions using &lt;, &lt;=, &gt;, and &gt;= between tpChars</td>
<td>8_str_relational_neg.pt.eOutput</td>
<td>Error @ 6-9: operand and operator types clash (eOperandOperatorTypeMismatch)</td>
</tr>

<tr>
<td>8_string_ops_pos.pt</td>
<td>Ensure various string operations form valid expressions</td>
<td>Various expressions with examples of all possible string operations</td>
<td>8_string_ops_pos.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_strlen_neg.pt</td>
<td>Ensure string length operator fails for non-tpChar operands</td>
<td>Attempt string length operations on tpInteger, tpArray, tpFile</td>
<td>8_strlen_neg.pt.eOutput</td>
<td>Error @ 7-9: operand and operator types clash (eOperandOperatorTypeMismatch)</td>
</tr>

<tr>
<td>8_strlen_positive.pt</td>
<td>Ensure string length operator works for tpChar operands</td>
<td>Expression with string length operator on a tpChar</td>
<td>8_strlen_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_strlen_result_positive.pt</td>
<td>Ensure result of string length is of type tpInteger</td>
<td>Perform string length, then store result in a tpInteger variable</td>
<td>8_strlen_result_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_substring_neg.pt</td>
<td>Ensure substring operator fails for operands of invalid type</td>
<td>Substring expressions with operand combinations other than tpChar, tpInteger, tpInteger</td>
<td>8_substring_neg.pt.eOutput</td>
<td>Error @ 6-12: operand and operator types clash (eOperandOperatorTypeMismatch)</td>
</tr>

<tr>
<td>8_substring_positive.pt</td>
<td>Ensure substring operator works for operands tpChar, tpInteger, tpInteger</td>
<td>Substring expression with operands of types tpChar, tpInteger, tpInteger, respectively</td>
<td>8_substring_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>8_substring_result_positive.pt</td>
<td>Ensure result of substring is of type tpChar</td>
<td>Perform substring operation, then store result in a tpChar variable</td>
<td>8_substring_result_positive.pt.eOutput</td><td></td>
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
<td>6_choose_intreqd_negative.pt</td>
<td>Trigger #eIntegerConstReqd for a defined constant and an integer constant as the condition</td>
<td>Runs two separate choose statements: one with a string constant condition and the other with an integer variable condition - both are different logical paths in semantic.ssl</td>
<td>6_choose_intreqd_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_choose_undefined_negative.pt</td>
<td>Trigger #eUndefinedIdentifier</td>
<td>Runs a choose statement with an undefined identifier as the condition</td>
<td>6_choose_undefined_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_chooseselector_negative.pt</td>
<td>Trigger #eIntegerExpnReqd</td>
<td>Runs a choose statement with the selector as a non-integer expression - as a string</td>
<td>6_chooseselector_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_duplicatecase_negative.pt</td>
<td>Trigger #eDuplicateLabel</td>
<td>Runs a choose statement with multiple of the same case conditions</td>
<td>6_duplicatecase_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_nonboolean_cond_negative.pt</td>
<td>Trigger #eBooleanExpnReqd</td>
<td>Runs an if statement, elseif statement, repeat while, and while statement with arithmetic expressions rather than boolean expressions as their conditions</td>
<td>6_nonboolean_cond_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_inscope_positive.pt</td>
<td>Test whether variables and constants within scope are accessible from a nested scope and an uplevel transition to an outer scope.</td>
<td>Declare a global variable and constant, uses the constant as the condition to an if statement, accesses the variable within the if statement, and after the if block.</td>
<td>6_inscope_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>6_outscope_negative.pt</td>
<td>Test whether variables and constants declared within a nested scope are accessible from an outer scope</td>
<td>Declares a variable within the if statement and attempt to access it outside of the if statement</td>
<td>6_outscope_negative.pt.eOutput</td><td></td>
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
<td>7_stringBasic_positive.pt</td>
<td>Testing the declaration of strings</td>
<td>Strings of differing lengths and types are declared</td>
<td>7_stringBasic_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_stringEmpty_positive.pt</td>
<td>Testing an empty string implementation</td>
<td>An empty string is declared</td>
<td>7_stringEmpty_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_stringsArray_positive.pt</td>
<td>Testing the declaration of a string array of different lengths</td>
<td>Several different string arrays are declared</td>
<td>7_stringsArray_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_stringsIO_positive.pt</td>
<td>Testing IO for strings</td>
<td>Using IO functions to test trap implementations</td>
<td>7_stringsIO_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_stringsLike_positive.pt</td>
<td>To test the functionality of the like command for strings</td>
<td>A string is declared and assigned to using the "like" syntax</td>
<td>7_stringsLike_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_strings_TooLong_negative.pt</td>
<td>Testing max string length</td>
<td>String is declared with length over 255, and the proper error is thrown</td>
<td>7_strings_TooLong_negative.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_stringsAssignments_positive.pt</td>
<td>Test Assignments of Strings</td>
<td>Various assignment methods are used.</td>
<td>7_stringsAssignments_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_stringsAssign_positive.pt</td>
<td>Test the assign IO function</td>
<td>Proper use of assign function is used with file and string</td>
<td>7_stringsAssignments_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>7_stringsAssign_negative.pt</td>
<td>Test the assign IO function</td>
<td>Use assign function without a string parameter, produces a semantic error.</td>
<td>7_stringsAssign_negative.pt.eOutput</td><td></td>
</tr>

</table>