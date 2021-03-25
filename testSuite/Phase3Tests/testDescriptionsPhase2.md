# Test Descriptions

## Modifications for Phase 3

If you haven't already read `testDescriptionsPhase3.md`, please do so first before reading this file.

This file is copied verbatim from `Phase2Tests/` (we didn't need to modify any of our test descriptions). There are some positive tests here that passed parser phase which now fail on semantic phase; we leave them in for the sake of preserving the original Phase 2 tests.

Note that the File Name and Expected Output Filename columns have not changed either, although their relative paths are no longer correct. The actual relative paths are as follows:

- For a test with File Name `program_path.pt`, you can find the actual program at `../Phase2Tests/program_path.pt`
- For a test with Expected Output Filename `program_path.pt.eOutput`, you can find the (semnatic phase) expected output at `phase2_eOutput/program_path.pt.eOutput`
- For a test with Expected Output Filename `program_path.pt.eOutput`, you can find the original (parser phase) expected output at `../Phase2Tests/program_path.pt.eOutput`

## Justification for Completeness
For each new language feature or revised syntax, we added at least one positive test case (often with overlap in larger test programs) that demonstrates correct parsing of valid Like code. Test cases were generated for each fork on new logic paths. Like operators have negative tests for invalid/missing operands (String operators, Short form assignment operators, Arithmetic operators, etc.). Multi-keyword statements have a negative test for each logic path where a keyword could be missing or invalid (If/Else, RepeatWhile, etc.). Also, deprecated PT keywords and operators were tested to ensure that their functionality had been invalidated. e.g. `program output;`.

1. Token definitions were tested implicitly, as there is no good way to test the parser on token definitions alone.
2. Programs were tested through 0, 1 and multiple parameters as well as testing the 'using' keyword and invalid keywords.
3. Declarations were tested using both types of declarations (with and without Like keyword), as well as testing syntactically invalid use of the Like keyword.
4. Routines were tested through 0, 1 and multiple parameters as well as testing with invalid parameter separators (semicolons) as well as missing an `end;` statement. All above cases were also done with the optional `public` keyword.
5. Complete package testing coverage is ensured with negative tests involving missing package names and keywords (`is`, `end`, etc.). A positive test includes both a non-empty and empty package.
6. Else-if statements were tested by forcing the parser through each valid logic path with the restrictions of a mandatory if statement, optional multiple elseif statements, an optional else statement and a terminating end;. Negative tests ensured all restrictions were enforced such as the mandatory if, then, and end; tokens. It was ensured that the inclusion of elseif statements produced the same output as a nested if statement, as this was the option chosen.
7. Short form assignments were tested by testing each assignment arithmetically. The negative test was designed with each short form assignment statement flipped (*= vs =*) to ensure these are not accepted.
8. Operator Syntax was tested through proper use of the `\`, `%`, `=`, `==`, `!=` operators. As well, deprecated operators `div` and `mod` were tested to ensure they no longer function as operators. Changed conditional operators `<>`, `=` and assignment `:=` were tested to ensure they cause syntax errors.
9. Complete choose statement testing ensured between negative tests with missing/misplaced/unexpected keywords (`then`, `when`, `of`), missing identifiers (no expression), and invalid structure (no cases, only an `else` case). Positive tests demonstrate valid `choose` statements
10. Repeat and repeat while statements have negative tests for missing expressions, missing keywords (`end`), and invalid structure (missing body). Positive tests demonstrate parsing valid repeat and repeat while statements
11. String operations tested positively with examples of all operators (concat, repeat, substring, length) working correctly in a program. Negative test cases test parsing when invalid/missing operands are specified.

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
<td>baseProgram.pt</td>
<td>Base program testing with no declarations or any content in the body</td>
<td>Empty program body declared</td>
<td>baseProgram.pt.eOutput</td><td></td>
</tr>

<tr>
<td>baseProgram_negative.pt</td>
<td>Test program syntax</td>
<td>Example of an incorrect program keyword, from old PT syntax.</td>
<td>baseProgram_negative.pt.eOutput</td><td>Syntax error at line 1 due to incorrect routine keyword</td>
</tr>

<tr>
<td>program.pt</td>
<td>Ensures that Like main program yields the correct sequence of tokens</td>
<td>Declares a program with a single assignment inside</td>
<td>program.pt.eOutput</td><td></td>
</tr>

<tr>
<td>program_negative_no_params.pt</td>
<td>Ensure error is emitted when no parameters supplied to program after 'using'</td>
<td>Declares an invalid program consisting only of 'using;'</td>
<td>program_negative_no_params.pt.eOutput</td><td>Syntax error @ line 1 of file due to no params</td>
</tr>

<tr>
<td>programs1Param.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for a single parameter</td>
<td>Declares a program with a single parameter with a single assignment inside</td>
<td>programs1Param.pt.eOutput</td><td></td>
</tr>

<tr>
<td>programsMultiParam.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for multiple parameters</td>
<td>Declares a program with mutliple parameters with a single assignment inside</td>
<td>programsMultiParam.pt.eOutput</td><td></td>
</tr>

<tr>
<td>routinesBasic.pt</td>
<td>Ensures that a simple routine declaration yields the proper tokens</td>
<td>Declares a routine with a single declaration inside</td>
<td>routinesBasic.pt.eOutput</td><td></td>
</tr>

<tr>
<td>routinesPublic.pt</td>
<td>Ensures that a simple public routine declaration yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside</td>
<td>routinesPublic.pt.eOutput</td><td></td>
</tr>

<tr>
<td>routinesBasic_negative.pt</td>
<td>Test routines syntax</td>
<td>Example of an incorrect routine declatation, from old PT syntax.</td>
<td>routinesBasic_negative.pt.eOutput</td><td>Syntax error @ line 2 due to incorrect routine declaration using old PT syntax</td>
</tr>

<tr>
<td>routinesBasicParameters_negative.pt</td>
<td>Test routines syntax</td>
<td>Example of an incorrect routine declatation with parameters separated by semicolons, from old PT syntax. This can be seen from the syntax error emitted in output file</td>
<td>routinesBasicParameters_negative.pt.eOutput</td><td>Syntax error @ line 2 due to ';' separation of parameters instead of commas</td>
</tr>

<tr>
<td>routinesBasic1Param.pt</td>
<td>Ensures that a simple routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a routine with a single declaration with 1 parameter inside</td>
<td>routinesBasic1Param.pt.eOutput</td><td></td>
</tr>

<tr>
<td>routinesPublic1Param.pt</td>
<td>Ensures that a simple public routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside and 1 parameter</td>
<td>routinesPublic1Param.pt.eOutput</td><td></td>
</tr>

<tr>
<td>routinesBasicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a routine with a single declaration inside and multiple parameters</td>
<td>routinesBasicMultiParam.pt.eOutput</td><td></td>
</tr>

<tr>
<td>routinesPublicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a public with a single declaration inside and multiple parameters</td>
<td>routinesPublicMultiParam.pt.eOutput</td><td></td>
</tr>

<tr>
<td>routinesNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a routine with no end and a single declaration</td>
<td>routinesNoEnd_negative.pt.eOutput</td><td>Error @ line 4 of file due to missing end statement for routine</td>
</tr>

<tr>
<td>routinesPublicNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a public routine with no end and a single declaration</td>
<td>routinesPublicNoEnd_negative.pt.eOutput</td><td>Error @ line 4 of file due to missing end statement for routine</td>
</tr>

<tr>
<td>declarations_positive.pt</td>
<td>Ensures that variable declarations using 'like' keyword are working properly</td>
<td>Runs various variable declarations with and without the 'like' keyword</td>
<td>declarations_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>declarations_negative.pt</td>
<td>Ensures that variable declarations using 'like' keyword are working properly</td>
<td>Runs variable declarations without a size specified for arrays and without essential 'like' statementkeywords</td>
<td>declarations_negative.pt.eOutput</td><td>Used invalid syntax for declaration statements resulting in syntax errors for lines 3, 5 and 7</td>
</tr>

<tr>
<td>shortFormAssignment_positive.pt</td>
<td>Ensures that short form assignments and associated arithmetic operations are  as expected</td>
<td>Runs all of the short form assignments as well as the equivalent assignment and operation statements to compare expected outputs</td>
<td>shortFormAssignment_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>shortFormAssignment_negative.pt</td>
<td>Ensures that short form assignments that are not syntactically correct output as expected</td>
<td>Runs all of the short form assignments with the assignment operator in the wrong spot.</td>
<td>shortFormAssignment_negative.pt.eOutput</td><td>Short form assignment statements were written with the wrong order (syntax errors for lines 5 to 9).</td>
</tr>

<tr>
<td>ifnoelse_positive.pt</td>
<td>Ensure that `elseif` and `else` are optional. </td>
<td>Runs a single if statement</td>
<td>ifnoelse_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>ifelse_positive.pt</td>
<td>Ensure an if-else statement is legal, `elseif` is optional</td>
<td>Runs an if statement followed by an else statement</td>
<td>ifelse_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>elseif_positive.pt</td>
<td>Ensures that when elseif statements are used, they appear equivalent to nested if statements</td>
<td>Runs an if-elseif chain then an equivalent nested if statement</td>
<td>elseif_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>chained_elseif_positive.pt</td>
<td>Ensures that multiple elseif statemetns are legal, without an else</td>
<td>Runs an if statement and multiple elseif statements</td>
<td>chained_elseif_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>else_positive.pt</td>
<td>Ensures that if-elseif chain is legal, with an else</td>
<td>Runs an if statement, multiple elseif statements and an else statement</td>
<td>else_positive.pt.eOutput</td><td></td>
</tr>

<tr>
<td>elseif_negative.pt</td>
<td>Ensures that elseif blocks can only follow an if block</td>
<td>Runs an elseif statement on its own</td>
<td>elseif_negative.pt.eOutput</td><td>Syntax error at line 4 due to unexpected 'elseif' without preceding 'if'</td>
</tr>

<tr>
<td>else_negative.pt</td>
<td>Ensures that else blocks can only follow an if block</td>
<td>Runs an else statement on its own</td>
<td>else_negative.pt.eOutput</td><td>Syntax error at line 4 due to unexpected 'else' without preceding 'if'</td>
</tr>

<tr>
<td>if_noend_negative.pt</td>
<td>Ensures that `end;` must follow an if statement block</td>
<td>Runs a single if statement without an end</td>
<td>if_noend_negative.pt.eOutput</td><td>Unexpected end of file error at line 5 since 'end;' is absent</td>
</tr>

<tr>
<td>ifchain_noend_negative.pt</td>
<td>Ensures that each if block has a corresponding `end;`</td>
<td>Runs a chain of if statements with only an end after the last one</td>
<td>ifchain_noend_negative.pt.eOutput</td><td>Unexpected end of file error at line 8 since 'end;' is absent for "outer" if.</td>
</tr>

<tr>
<td>elseif_noend_negative.pt</td>
<td>Ensures that the elseif logical path still enforces an `end;` if it's not followed by an else or elseif</td>
<td>Runs an if and elseif statement with no end</td>
<td>elseif_noend_negative.pt.eOutput</td><td>Unexpected end of file error at line 9 due to no 'end;'</td>
</tr>

<tr>
<td>ifelse_noend_negative.pt</td>
<td>Ensures that the else logical path enforces an `end;`</td>
<td>Runs an if and else statement with no end</td>
<td>ifelse_noend_negative.pt.eOutput</td><td>Unexpected end of file error at line 9 due to no 'end;'</td>
</tr>

<tr>
<td>ifthen_negative.pt</td>
<td>Ensures that if and elseif expressions include a `then`</td>
<td>Runs an if and elseif statement with no then</td>
<td>ifthen_negative.pt.eOutput</td><td>Syntax error at line 5 because it's expecting a 'then'</td>
</tr>

<tr>
<td>elseifthen_negative.pt</td>
<td>Ensures that if and elseif expressions include a `then`</td>
<td>Runs an if and elseif statement with no then</td>
<td>elseifthen_negative.pt.eOutput</td><td>Syntax error at line 7 because it's expecting a 'then'</td>
</tr>

<tr>
<td>multiple_else_negative.pt</td>
<td>Ensures that only one else statement is allowed</td>
<td>Runs an if followed by multiple else statements</td>
<td>multiple_else_negative.pt.eOutput</td><td>Syntax error at line 8 because it's expecting an 'end;'</td>
</tr>

<tr>
<td>choose_negative_misplaced_then.pt</td>
<td>Test behaviour of a choose statement lacking 'then' following 'when ...' or unneeded 'then' following 'else'</td>
<td>Choose statement with no then after 'when', and extra 'then' following 'else'</td>
<td>choose_negative_misplaced_then.pt.eOutput</td>
<td>Error @ lines 6, 8: missing 'then', 10: unexpected 'then'</td>
</tr>

<tr>
<td>choose_negative_no_cases.pt</td>
<td>Test behaviour of a choose statement without any cases</td>
<td>Choose statement without any 'when' cases in body</td>
<td>choose_negative_no_cases.pt.eOutput</td>
<td>Error @ lines 5/6: missing 'when'</td>
</tr>

<tr>
<td>choose_negative_no_end.pt</td>
<td>Test behaviour of choose statement with no 'end;' terminating the statement</td>
<td>A choose statement with a single 'when' case and nothing following (i.e. pEndFile)</td>
<td>choose_negative_no_end.pt.eOutput</td>
<td>Error @ line 8: missing 'end;'</td>
</tr>

<tr>
<td>choose_negative_no_expression.pt</td>
<td>Test behaviour of choose statement without an expression following 'choose'</td>
<td>Choose statement with no expression or 'of' following 'choose', followed by multiple 'when' cases</td>
<td>choose_negative_no_expression.pt.eOutput</td>
<td>Error @ line 5: missing expression, 'of'</td>
</tr>

<tr>
<td>choose_negative_when_outside_choose.pt</td>
<td>Test behaviour of a 'when' clause outside of a choose statement</td>
<td>A when statement that isn't inside a choose</td>
<td>choose_negative_when_outside_choose.pt.eOutput</td>
<td>Error @ line 5: unexpected 'when'</td>
</tr>

<tr>
<td>choose_positive.pt</td>
<td>Test behaviour of valid choose statements, with or without default case</td>
<td>Two choose statements: first with multiple 'when' and an 'else', second with a single 'when'</td>
<td>choose_positive.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>packages_negative_name_is.pt</td>
<td>Test 'pkg' that lacks a name and the 'is' </td>
<td>A single 'pkg' without identifier or 'is' following 'pkg'. Valid package contents follow</td>
<td>packages_negative_name_is.pt.eOutput</td>
<td>Error @ 3: missing identifier, 'is'</td>
</tr>

<tr>
<td>packages_negative_no_end.pt</td>
<td>Test 'pkg' that doesn't have an 'end;' to terminate it </td>
<td>A 'pkg' without proper 'end;' to end it, followed by code that should be outside the package</td>
<td>packages_negative_no_end.pt.eOutput</td>
<td>Error @ 9: missing 'end;'</td>
</tr>

<tr>
<td>packages_positive.pt</td>
<td>Test parsing of valid packages (empty or non-empty) within a small program</td>
<td>A package with mixed public/non-public members, then a val outside any package, then an empty package</td>
<td>packages_positive.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>repeatWhile_negative_no_condition.pt</td>
<td>Test parsing of repeat ... while statement without a condition following the 'while'</td>
<td>Small program with invalid repeat while loop, lacking condition after 'while'</td>
<td>repeatWhile_negative_no_condition.pt.eOutput</td>
<td>Error @ 7: missing expression</td>
</tr>

<tr>
<td>repeatWhile_positive.pt</td>
<td>Test parsing of valid repeat ... while statement with regular or (almost) empty bodies</td>
<td>Two while loops: one with a condition and body that will terminate, and one that would loop forever (empty body)</td>
<td>repeatWhile_positive.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>while_negative_no_body.pt</td>
<td>Test parsing of repeat while ... statement without anything after 'while'</td>
<td>Small program with invalid repeat while loop. No condition or block following 'while'</td>
<td>while_negative_no_condition.pt.eOutput</td>
<td>Error @ 3: missing expression</td>
</tr>

<tr>
<td>while_negative_no_condition.pt</td>
<td>Test parsing of repeat while ... statement without a condition following the 'while'</td>
<td>Small program with invalid repeat while loop, lacking condition after 'while', which jumps directly into loop body</td>
<td>while_negative_no_condition.pt.eOutput</td>
<td>Error @ 5: missing expression</td>
</tr>

<tr>
<td>while_negative_no_end.pt</td>
<td>Test parsing of repeat while ... loop which lacks the 'end;' to terminate the Block</td>
<td>Small program with invalid while loop (lacks 'end;'), followed by code that would otherwise be outside of the loop body</td>
<td>while_negative_no_end.pt.eOutput</td>
<td>Error @ 7: missing 'end;'</td>
</tr>

<tr>
<td>while_positive.pt</td>
<td>Test parsing of valid repeat while ... statement with regular or (almost) empty bodies</td>
<td>Two while loops: one with a condition and body that will terminate, and one that would loop forever (empty body)</td>
<td>while_positive.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>str_ops_negative_bad_operand.pt</td>
<td>Test parsing of all string operations when one of the operands is an invalid type. Should be parsed without syntax error</td>
<td>Example of each string operation (4 total) with the type of one operand being incorrect</td>
<td>str_ops_negative_bad_operand.pt.eOutput</td>
<td>No errors, but operand types don't comply with expected types (not dealt with in parser)</td>
</tr>

<tr>
<td>str_ops_negative_missing_operand.pt</td>
<td>Test parsing of all string operations when one of the operands is missing</td>
<td>Example of each string operation (4 total) with the last operand missing from the statement</td>
<td>str_ops_negative_missing_operand.pt.eOutput</td>
<td>Error @ lines 5, 6, 7, 8: missing expressions (operands)</td>
</tr>

<tr>
<td>str_ops_positive.pt</td>
<td>Test parsing of all string operations</td>
<td>Example of each string operation (4 total) in a valid program</td>
<td>str_ops_positive.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>fullProgram.pt</td>
<td>Test parsing of as many phase 2 parser modifications in a single program</td>
<td>One large program that should be parsed without error</td>
<td>fullProgram.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>operatorSyntaxTest.pt</td>
<td>Test parsing of new operator syntax</td>
<td>Simple assingment and comparison operators</td>
<td>operatorSyntaxTest.pt.eOutput</td><td></td>
</tr>

<tr>
<td>operatorSyntaxTest1_negative.pt</td>
<td>Test to ensure old div and mod operators no longer work</td>
<td>Small program that uses keyword div and mod as variables, showing that they are no longer treated as division and modulo</td>
<td>operatorSyntaxTest1_negative.pt.eOutput</td><td>No errors present due to proper var syntax. Would not be possible if div and mod were treated as operands</td>
</tr>

<tr>
<td>operatorSyntaxTest2_negative.pt</td>
<td>Test old PT equality operator</td>
<td>If statement with old "=" equality operator</td>
<td>operatorSyntaxTest2_negative.pt.eOutput</td><td>Error @ line 5 due to incorrect use of "=" operand on Like spec.</td>
</tr>

<tr>
<td>operatorSyntaxTest3_negative.pt</td>
<td>Test old pt NE operator</td>
<td>If statement with old "<>" equality operator</td>
<td>operatorSyntaxTest3_negative.pt.eOutput</td><td>Error @ line 5 due to incorrect use of "<>".</td>
</tr>

</table>
