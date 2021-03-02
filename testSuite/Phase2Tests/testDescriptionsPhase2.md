# Test Descriptions

<table>
<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output Filename</th>
</tr>

<tr>
<td>baseProgram.pt</td>
<td>Base program testing with no declarations or any content in the body</td>
<td>Empty program body declared</td>
<td>baseProgram.pt.eOutput</td>
</tr>

<tr>
<td>baseProgram_negative.pt</td>
<td>Test program syntax</td>
<td>Example of an incorrect program keyword, from old PT syntax.</td>
<td>baseProgram_negative.pt.eOutput</td>
</tr>

<tr>
<td>program.pt</td>
<td>Ensures that Like main program yields the correct sequence of tokens</td>
<td>Declares a program with a single assignment inside</td>
<td>program.pt.eOutput</td>
</tr>

<tr>
<td>program_negative_no_params.pt</td>
<td>Ensure error is emitted when no parameters supplied to program after 'using'</td>
<td>Declares an invalid program consisting only of 'using;'</td>
<td>program_negative_no_params.pt.eOutput</td>
</tr>

<tr>
<td>programs1Param.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for a single parameter</td>
<td>Declares a program with a single parameter with a single assignment inside</td>
<td>programs1Param.pt.eOutput</td>
</tr>

<tr>
<td>programsMultiParam.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for multiple parameters</td>
<td>Declares a program with mutliple parameters with a single assignment inside</td>
<td>programsMultiParam.pt.eOutput</td>
</tr>

<tr>
<td>routinesBasic.pt</td>
<td>Ensures that a simple routine declaration yields the proper tokens</td>
<td>Declares a routine with a single declaration inside</td>
<td>routinesBasic.pt.eOutput</td>
</tr>

<tr>
<td>routinesPublic.pt</td>
<td>Ensures that a simple public routine declaration yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside</td>
<td>routinesPublic.pt.eOutput</td>
</tr>

<tr>
<td>routinesBasic_negative.pt</td>
<td>Test routines syntax</td>
<td>Example of an incorrect routine declatation, from old PT syntax.</td>
<td>routinesBasic_negative.pt.eOutput</td>
</tr>

<tr>
<td>routinesBasicParameters_negative.pt</td>
<td>Test routines syntax</td>
<td>Example of an incorrect routine declatation with parameters separated by semicolons, from old PT syntax. This can be seen from the syntax error emitted in output file</td>
<td>routinesBasicParameters_negative.pt.eOutput</td>
</tr>

<tr>
<td>routinesBasic1Param.pt</td>
<td>Ensures that a simple routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a routine with a single declaration with 1 parameter inside</td>
<td>routinesBasic1Param.pt.eOutput</td>
</tr>

<tr>
<td>routinesPublic1Param.pt</td>
<td>Ensures that a simple public routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside and 1 parameter</td>
<td>routinesPublic1Param.pt.eOutput</td>
</tr>

<tr>
<td>routinesBasicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a routine with a single declaration inside and multiple parameters</td>
<td>routinesBasicMultiParam.pt.eOutput</td>
</tr>

<tr>
<td>routinesPublicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a public with a single declaration inside and multiple parameters</td>
<td>routinesPublicMultiParam.pt.eOutput</td>
</tr>

<tr>
<td>routinesNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a routine with no end and a single declaration</td>
<td>routinesNoEnd_negative.pt.eOutput</td>
</tr>

<tr>
<td>routinesPublicNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a public routine with no end and a single declaration</td>
<td>routinesPublicNoEnd_negative.pt.eOutput</td>
</tr>

<tr>
<td>declarations_positive.pt</td>
<td>Ensures that variable declarations using 'like' keyword are working properly</td>
<td>Runs various variable declarations with and without the 'like' keyword</td>
<td>declarations_positive.pt.eOutput</td>
</tr>

<tr>
<td>declarations_negative.pt</td>
<td>Ensures that variable declarations using 'like' keyword are working properly</td>
<td>Runs variable declarations without a size specified for arrays and without essential 'like' statementkeywords</td>
<td>declarations_negative.pt.eOutput</td>
</tr>

<tr>
<td>shortFormAssignment_positive.pt</td>
<td>Ensures that short form assignments and associated arithmetic operations are  as expected</td>
<td>Runs all of the short form assignments as well as the equivalent assignment and operation statements to compare expected outputs</td>
<td>shortFormAssignment_positive.pt.eOutput</td>
</tr>

<tr>
<td>shortFormAssignment_negative.pt</td>
<td>Ensures that short form assignments that are not syntactically correct output as expected</td>
<td>Runs all of the short form assignments with the assignment operator in the wrong spot, as well as a test to ensure that the old PT assignment statement '<>' is no longer valid</td>
<td>shortFormAssignment_negative.pt.eOutput</td>
</tr>

<tr>
<td>ifnoelse_positive.pt</td>
<td>Ensure that `elseif` and `else` are optional. </td>
<td>Runs a single if statement</td>
<td>ifnoelse_positive.pt.eOutput</td>
</tr>

<tr>
<td>ifelse_positive.pt</td>
<td>Ensure an if-else statement is legal, `elseif` is optional</td>
<td>Runs an if statement followed by an else statement</td>
<td>ifelse_positive.pt.eOutput</td>
</tr>

<tr>
<td>elseif_positive.pt</td>
<td>Ensures that when elseif statements are used, they appear equivalent to nested if statements</td>
<td>Runs an if-elseif chain then an equivalent nested if statement</td>
<td>elseif_positive.pt.eOutput</td>
</tr>

<tr>
<td>chained_elseif_positive.pt</td>
<td>Ensures that multiple elseif statemetns are legal, without an else</td>
<td>Runs an if statement and multiple elseif statements</td>
<td>chained_elseif_positive.pt.eOutput</td>
</tr>

<tr>
<td>else_positive.pt</td>
<td>Ensures that if-elseif chain is legal, with an else</td>
<td>Runs an if statement, multiple elseif statements and an else statement</td>
<td>else_positive.pt.eOutput</td>
</tr>

<tr>
<td>elseif_negative.pt</td>
<td>Ensures that elseif blocks can only follow an if block</td>
<td>Runs an elseif statement on its own</td>
<td>elseif_negative.pt.eOutput</td>
</tr>

<tr>
<td>else_negative.pt</td>
<td>Ensures that else blocks can only follow an if block</td>
<td>Runs an else statement on its own</td>
<td>else_negative.pt.eOutput</td>
</tr>

<tr>
<td>if_noend_negative.pt</td>
<td>Ensures that `end;` must follow an if statement block</td>
<td>Runs a single if statement without an end</td>
<td>if_noend_negative.pt.eOutput</td>
</tr>

<tr>
<td>ifchain_noend_negative.pt</td>
<td>Ensures that each if block has a corresponding `end;`</td>
<td>Runs a chain of if statements with only an end after the last one</td>
<td>ifchain_noend_negative.pt.eOutput</td>
</tr>

<tr>
<td>elseif_noend_negative.pt</td>
<td>Ensures that the elseif logical path still enforces an `end;` if it's not followed by an else or elseif</td>
<td>Runs an if and elseif statement with no end</td>
<td>elseif_noend_negative.pt.eOutput</td>
</tr>

<tr>
<td>ifelse_noend_negative.pt</td>
<td>Ensures that the else logical path enforces an `end;`</td>
<td>Runs an if and else statement with no end</td>
<td>ifelse_noend_negative.pt.eOutput</td>
</tr>

<tr>
<td>then_negative.pt</td>
<td>Ensures that if and elseif expressions include a `then`</td>
<td>Runs an if and elseif statement with no then</td>
<td>then_negative.pt.eOutput</td>
</tr>

<tr>
<td>multiple_else_negative.pt</td>
<td>Ensures that only one else statement is allowed</td>
<td>Runs an if followed by multiple else statements</td>
<td>multiple_else_negative.pt.eOutput</td>
</tr>

<tr>
<td>choose_negative_misplaced_then.pt</td>
<td>Test behaviour of a choose statement lacking 'then' following 'when ...' or unneeded 'then' following 'else'</td>
<td>Choose statement with no then after 'when', and extra 'then' following 'else'</td>
<td>choose_negative_misplaced_then.pt.eOutput</td>
</tr>

<tr>
<td>choose_negative_no_cases.pt</td>
<td>Test behaviour of a choose statement without any cases</td>
<td>Choose statement without any 'when' cases in body</td>
<td>choose_negative_no_cases.pt.eOutput</td>
</tr>

<tr>
<td>choose_negative_no_end.pt</td>
<td>Test behaviour of choose statement with no 'end;' terminating the statement</td>
<td>A choose statement with a single 'when' case and nothing following (i.e. pEndFile)</td>
<td>choose_negative_no_end.pt.eOutput</td>
</tr>

<tr>
<td>choose_negative_no_expression.pt</td>
<td>Test behaviour of choose statement without an expression following 'choose'</td>
<td>Choose statement with no expression or 'of' following 'choose', followed by multiple 'when' cases</td>
<td>choose_negative_no_expression.pt.eOutput</td>
</tr>

<tr>
<td>choose_negative_when_outside_choose.pt</td>
<td>Test behaviour of a 'when' clause outside of a choose statement</td>
<td>A when statement that isn't inside a choose</td>
<td>choose_negative_when_outside_choose.pt.eOutput</td>
</tr>

<tr>
<td>choose_positive.pt</td>
<td>Test behaviour of valid choose statements, with or without default case</td>
<td>Two choose statements: first with multiple 'when' and an 'else', second with a single 'when'</td>
<td>choose_positive.pt.eOutput</td>
</tr>

<tr>
<td>packages_negative_name_is.pt</td>
<td>Test 'pkg' that lacks a name and the 'is' </td>
<td>A single 'pkg' without identifier or 'is' following 'pkg'. Valid package contents follow</td>
<td>packages_negative_name_is.pt.eOutput</td>
</tr>

<tr>
<td>packages_negative_no_end.pt</td>
<td>Test 'pkg' that doesn't have an 'end;' to terminate it </td>
<td>A 'pkg' without proper 'end;' to end it, followed by code that should be outside the package</td>
<td>packages_negative_no_end.pt.eOutput</td>
</tr>

<tr>
<td>packages_positive.pt</td>
<td>Test parsing of valid packages (empty or non-empty) within a small program</td>
<td>A package with mixed public/non-public members, then a val outside any package, then an empty package</td>
<td>packages_positive.pt.eOutput</td>
</tr>

<tr>
<td>repeatWhile_negative_no_condition.pt</td>
<td>Test parsing of repeat ... while statement without a condition following the 'while'</td>
<td>Small program with invalid repeat while loop, lacking condition after 'while'</td>
<td>repeatWhile_negative_no_condition.pt.eOutput</td>
</tr>

<tr>
<td>repeatWhile_positive.pt</td>
<td>Test parsing of valid repeat ... while statement with regular or (almost) empty bodies</td>
<td>Two while loops: one with a condition and body that will terminate, and one that would loop forever (empty body)</td>
<td>repeatWhile_positive.pt.eOutput</td>
</tr>

<tr>
<td>while_negative_no_condition.pt</td>
<td>Test parsing of repeat while ... statement without a condition following the 'while'</td>
<td>Small program with invalid repeat while loop, lacking condition after 'while', which jumps directly into loop body</td>
<td>while_negative_no_condition.pt.eOutput</td>
</tr>

<tr>
<td>while_negative_no_end.pt</td>
<td>Test parsing of repeat while ... loop which lacks the 'end;' to terminate the Block</td>
<td>Small program with invalid while loop (lacks 'end;'), followed by code that would otherwise be outside of the loop body</td>
<td>while_negative_no_end.pt.eOutput</td>
</tr>

<tr>
<td>while_positive.pt</td>
<td>Test parsing of valid repeat while ... statement with regular or (almost) empty bodies</td>
<td>Two while loops: one with a condition and body that will terminate, and one that would loop forever (empty body)</td>
<td>while_positive.pt.eOutput</td>
</tr>

<tr>
<td>str_ops_negative_bad_operand.pt</td>
<td>Test parsing of all string operations when one of the operands is an invalid type. Should be parsed without syntax error</td>
<td>Example of each string operation (4 total) with the type of one operand being incorrect</td>
<td>str_ops_negative_bad_operand.pt.eOutput</td>
</tr>

<tr>
<td>str_ops_negative_missing_operand.pt</td>
<td>Test parsing of all string operations when one of the operands is missing</td>
<td>Example of each string operation (4 total) with the last operand missing from the statement</td>
<td>str_ops_negative_missing_operand.pt.eOutput</td>
</tr>

<tr>
<td>str_ops_positive.pt</td>
<td>Test parsing of all string operations</td>
<td>Example of each string operation (4 total) in a valid program</td>
<td>str_ops_positive.pt.eOutput</td>
</tr>

</table>
