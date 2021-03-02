# Test Descriptions

<table>
<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output</th>
<th>Actual Output</th>
</tr>

<tr>
<td>program.pt</td>
<td>Ensures that Like main program yields the correct sequence of tokens</td>
<td>Declares a program with a single assignment inside</td>
<td></td>
<td></td>
</tr>

<tr>
<td>programs1Param.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for a single parameter</td>
<td>Declares a program with a single parameter with a single assignment inside</td>
<td></td>
<td></td>
</tr>

<tr>
<td>programsMultiParam.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for multiple parameters</td>
<td>Declares a program with mutliple parameters with a single assignment inside</td>
<td></td>
<td>
</td>
</tr>

<td>declarations_positive.pt</td>
<td>Ensures that variable declarations using 'like' keyword are working properly</td>
<td>Runs various variable declarations with and without the 'like' keyword</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesBasic.pt</td>
<td>Ensures that a simple routine declaration yields the proper tokens</td>
<td>Declares a routine with a single declaration inside</td>
<td></td>
</tr>

<tr>
<td>declarations_negative.pt</td>
<td>Ensures that variable declarations using 'like' keyword are working properly</td>
<td>Runs variable declarations without a size specified for arrays and without essential 'like' statementkeywords</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesPublic.pt</td>
<td>Ensures that a simple public routine declaration yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesBasic1Param.pt</td>
<td>Ensures that a simple routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a routine with a single declaration with 1 parameter inside</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesPublic1Param.pt</td>
<td>Ensures that a simple public routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside and 1 parameter</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesBasicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a routine with a single declaration inside and multiple parameters</td>
<td></td>
<td></td>
</tr>

<tr>
<td>shortFormAssignment_positive.pt</td>
<td>Ensures that short form assignments and associated arithmetic operations are  as expected</td>
<td>Runs all of the short form assignments as well as the equivalent assignment and operation statements to compare expected outputs</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesPublicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a public with a single declaration inside and multiple parameters</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a routine with no end and a single declaration</td>
<td></td>
<td></td>
</tr>

<tr>
<td>shortFormAssignment_negative.pt</td>
<td>Ensures that short form assignments that are not syntactically correct output as expected</td>
<td>Runs all of the short form assignments with the assignment operator in the wrong spot, as well as a test to ensure that the old PT assignment statement '<>' is no longer valid</td>
<td></td>
<td></td>
</tr>

<tr>
<td>routinesPublicNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a public routine with no end and a single declaration</td>
<td></td>
<td></td>
</tr>

<tr>
<td>ifnoelse_positive.pt</td>
<td>Ensure that `elseif` and `else` are optional. </td>
<td>Runs a single if statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>ifelse_positive.pt</td>
<td>Ensure an if-else statement is legal, `elseif` is optional</td>
<td>Runs an if statement followed by an else statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>elseif_positive.pt</td>
<td>Ensures that when elseif statements are used, they appear equivalent to nested if statements</td>
<td>Runs an if-elseif chain then an equivalent nested if statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>chained_elseif_positive.pt</td>
<td>Ensures that multiple elseif statemetns are legal, without an else</td>
<td>Runs an if statement and multiple elseif statements</td>
<td></td>
<td></td>
</tr>

<tr>
<td>else_positive.pt</td>
<td>Ensures that if-elseif chain is legal, with an else</td>
<td>Runs an if statement, multiple elseif statements and an else statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>elseif_negative.pt</td>
<td>Ensures that elseif blocks can only follow an if block</td>
<td>Runs an elseif statement on its own</td>
<td>NOT WORKING AS EXPECTED</td>
<td></td>
</tr>

<tr>
<td>else_negative.pt</td>
<td>Ensures that else blocks can only follow an if block</td>
<td>Runs an else statement on its own</td>
<td></td>
<td></td>
</tr>

<tr>
<td>if_noend_negative.pt</td>
<td>Ensures that `end;` must follow an if statement block</td>
<td>Runs a single if statement without an end</td>
<td></td>
<td></td>
</tr>

<tr>
<td>ifchain_noend_negative.pt</td>
<td>Ensures that each if block has a corresponding `end;`</td>
<td>Runs a chain of if statements with only an end after the last one</td>
<td></td>
<td></td>
</tr>

<tr>
<td>elseif_noend_negative.pt</td>
<td>Ensures that the elseif logical path still enforces an `end;` if it's not followed by an else or elseif</td>
<td>Runs an if and elseif statement with no end</td>
<td></td>
<td></td>
</tr>

<tr>
<td>ifelse_noend_negative.pt</td>
<td>Ensures that the else logical path enforces an `end;`</td>
<td>Runs an if and else statement with no end</td>
<td></td>
<td></td>
</tr>

<tr>
<td>then_negative.pt</td>
<td>Ensures that if and elseif expressions include a `then`</td>
<td>Runs an if and elseif statement with no then</td>
<td></td>
<td></td>
</tr>

<tr>
<td>multiple_else_negative.pt</td>
<td>Ensures that only one else statement is allowed</td>
<td>Runs an if followed by multiple else statements</td>
<td></td>
<td></td>
</tr>

<tr>
<td>baseProgram.pt</td>
<td>Base program testing with no declarations or any content in the body</td>
<td>Empty program body declared</td>
<td></td>
<td></td>
</tr>
</table>
