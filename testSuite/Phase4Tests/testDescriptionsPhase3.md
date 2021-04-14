# Test Descriptions

## Modifications for Phase 4

If you haven't already read `testDescriptionsPhase4.md`, please do so first before reading this file.

This file is copied verbatim from `Phase3Tests/` (we didn't need to modify any of our test descriptions). There are some positive tests here that passed parser phase which now fail on semantic phase; we leave them in for the sake of preserving the original Phase 3 tests.

Note that the File Name and Expected Output Filename columns have not changed either, although their relative paths are no longer correct. The actual relative paths are as follows:

- For a test with File Name `program_path.pt`, you can find the actual program at `../Phase3Tests/program_path.pt`
- For a test with Expected Output Filename `program_path.pt.eOutput`, you can find the (semnatic phase) expected output at `phase3_eOutput/program_path.pt.eOutput`
- For a test with Expected Output Filename `program_path.pt.eOutput`, you can find the original (parser phase) expected output at `../Phase3Tests/program_path.pt.eOutput`

## Justification for Completeness

In general, coverage is ensured through a multitude of new tests created to test steps 1 through 8 in the Phase 3 specification. Items that are not explicitly listed here (e.g. T-code model extension, definitions, etc.) are tested implicitly through their use in the testing of each step. Moreover, there is a high degree of overlap between many of the tested parts (e.g. initial values relying on variable declarations, string operations relying on changes the strings, etc.).

1. Programs were tested explicitly by running a base program successfully. 

2. Statements and declarations - affected by the changes to the `Block` and `Statement` rule - were tested iteratively with if statements, integer constants and integer output statements to ensure the positive logical paths behaved according to the Like specification. Upon this successful step, all other steps relied on combinations of declarations and statements. This includes intermixing declarations and statements, declaring multiple variables on a single line, and performing operations using expressions within statements. This provided full coverage of all the changes made to the `Block` and `Statement` rule. Negative and positive tests were developed to test the scope of intermixed declarations and statements, by trying to access variables of varying types both in and out of scope. 

3. Variable declaration coverage achieved by testing that only one variable can be declared per line, and a negative test for multiple declarations on the same line. Type specification coverage by checking the `like` keyword with all types of valid expressions (literals, constants, scalar variables) of all types (`tpInteger`, `tpBoolean`, `tpChar`, `tpFile`, and `tpArray`). We test that the expression must be a simple type with a negative test for `like array`, where array is of type `tpArray`. We also ensure undefined or invalid identifiers can't be used for `like` (`syFunction`, `syUndefined`, etc.). Array bounds are tested to make sure that the they are: positive (non-zero), of type `tpInteger`, and the symbols used are `syConstant` (not variables). Function parameters are covered implicitly through the testing for `like`, and also by making sure non-scalar values cannot be passed as scalars, and non-scalar types cannot be used as value parameters.

4. Initial values are tested by checking that: the result of every valid Expression can be assigned as an initial value, that `tpInteger`, `tpChar`, and `tpBoolean` types of kind constant, variable, literal, or from arrays can be supplied as an initial value, that a `tpFile` variable can be assigned as an initial value, and that `tpArray` cannot be assigned as initial value.

5. Complete package testing coverage is ensured with negative tests involving attempts to access a private package members (functions, vals and vars), as well as multiple packages with the same name. Positive tests ensure that public members of a package are available outside of the package's scope as expected.

6. Statement changes for the Like specification were tested thoroughly by running all of the previous tests in Phase 2 - which covered all positive and negative cases for shortform assignments, repeat while loops, elseif clauses and different choose statements. Additionally, to ensure proper behaviour when handling errors, each logical error path for the above statements was forced to output `eIntegerExpnReqd`, `eDuplicateLabel`, `eUndefinedInteger`,`eIntegerConstReqd` and `eBooleanExpnReqd` by developing negative cases with undesirable selectors, conditions, and duplicate cases. 

7. String assignment testing is complete as all variations of assignment (var, val, like) have been tested. String IO has been tested for get, put, getln, putln and assign along with negative cases (where applicable). These functions have been verified to emit the proper traps and tokens. This covers the changes to WriteText and AssignProcedure. All other changes are covered implictly within these test cases.

8. String operation coverage is ensured by: checking positive examples of each new string operation (string length, string concatenate, string repeat, substring, string equality, string inequality), checking that the results of the aforementioned operations are `tpInteger`, `tpChar`, `tpChar`, `tpChar`, `tpBoolean`, and `tpBoolean`, respectively. Every possible combination of invalid operand types are checked (e.g. using `tpInteger` where there should be a `tpChar` and vice versa) to make sure type mismatch errors are emitted. Finally, we check to make sure that relational comparison operations are not valid for strings. This also implicitly tests the changes to the T-code machine model that were required to implemented strings and string operations

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
<td>5_package_negative_noPublicAccess.pt</td>
<td>Tests the behaviour when a var in a package is not declared public and accessed outside the package</td>
<td>A package containing a non-public val, followed by an atempt to access this val from outside the package</td>
<td>5_package_negative_noPublicAccess.pt.eOutput</td><td>semantic error, line 7: identifier not declared (not public so this is expected)</td>
</tr>

<tr>
<td>5_package_positive_funInsidePkg.pt</td>
<td>Tests the behaviour when a public function is declared inside a package and then accessed outisde</td>
<td>A package containing a public function, followed by an attempt to access the function</td>
<td>5_package_positive_funInsidePkg.pt.eOutput</td><td>semantic error, line 7: identifier not declared (not public so this is expected)</td>
</tr>

<tr>
<td>5_package_negative_funInsidePkg.pt</td>
<td>Tests the behaviour when a private function is declared inside a package and then accessed outisde</td>
<td>A package containing a private function, followed by an attempt to access the function</td>
<td>5_package_negative_funInsidePkg.pt.eOutput</td><td></td>
</tr>

<tr>
<td>5_package_negative_multiName.pt</td>
<td>Tests the behaviour when two packages are declared with the same name</td>
<td>Two packages declared with the same name</td>
<td>5_package_negative_multiName.pt.eOutput</td><td>    #eMultiplyDefined
    semantic error, line 7: identifier declared twice</td>
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
<td>6_choose_intreqd_negative.pt.eOutput</td><td>Throws #eIntegerConstReqd for lines 5 and 12 because x is a string and y is a variable</td>
</tr>

<tr>
<td>6_choose_undefined_negative.pt</td>
<td>Trigger #eUndefinedIdentifier</td>
<td>Runs a choose statement with an undefined identifier as the condition</td>
<td>6_choose_undefined_negative.pt.eOutput</td><td>Throws #eUndefinedIndentifier for line 4 because x is undeclared</td>
</tr>

<tr>
<td>6_chooseselector_negative.pt</td>
<td>Trigger #eIntegerExpnReqd</td>
<td>Runs a choose statement with the selector as a non-integer expression - as a string</td>
<td>6_chooseselector_negative.pt.eOutput</td><td>Throws #eIntegerExpnReqd on line 6 because the selector must be an integer expression</td>
</tr>

<tr>
<td>6_duplicatecase_negative.pt</td>
<td>Trigger #eDuplicateLabel</td>
<td>Runs a choose statement with multiple of the same case conditions</td>
<td>6_duplicatecase_negative.pt.eOutput</td><td>Throws #eDuplicateLabel for lines 8 and 16 because the cases are the same as the ones in the same scope</td>
</tr>

<tr>
<td>6_nonboolean_cond_negative.pt</td>
<td>Trigger #eBooleanExpnReqd</td>
<td>Runs an if statement, elseif statement, repeat while, and while statement with arithmetic expressions rather than boolean expressions as their conditions</td>
<td>6_nonboolean_cond_negative.pt.eOutput</td><td>Throws #eBooleanExpnReqd for lines 6, 12 and 21 and #eTypeClash for line 18 because they are not boolean expressions and clash in Like with the sNot symbol.</td>
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
<td>6_outscope_negative.pt.eOutput</td><td>Identifier not declared on line 8 as it is out of scope.</td>
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
<td>String is declared with length over 255, and the proper parser error is thrown on line 3</td>
<td>7_strings_TooLong_negative.pt.eOutput</td><td>Line 3: scan/parse error, line 3: syntax error at: toolong
 scan/parse error, line 3: identifier or string too long </td>
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
<td>Use assign function without a string parameter, produces a semantic error on line 5.</td>
<td>7_stringsAssign_negative.pt.eOutput</td><td>Line 5: Semantic error #eFileNameReqd</td>
</tr>

</table>