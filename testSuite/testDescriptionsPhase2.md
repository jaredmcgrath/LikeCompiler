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
<td>ifnoelse_positive.pt</td>
<td>Ensure if ...then ... end is legal </td>
<td>Runs a single if statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>ifelse_positive.pt</td>
<td>Ensure if ...then ... else ... end is legal </td>
<td>Runs an if statement followed by an else statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>elseif_positive.pt</td>
<td>Ensures that when elseif statements are used, they appear equivalent to nested if statements</td>
<td>Runs an if statement, elseif statement and else statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>nestedif_positive.pt</td>
<td>Ensures that nested if statements are legal</td>
<td>Runs an if statement and else statement, with a nested if-else block in the else portion</td>
<td></td>
<td></td>
</tr>

<tr>
<td>noelse_positive.pt</td>
<td>Ensures that if-elseif chain is legal, without an else</td>
<td>Runs an if statement and elseif statement</td>
<td></td>
<td></td>
</tr>

<tr>
<td>elseif_negative.pt</td>
<td>Ensures that elseif blocks can only follow an if block</td>
<td>Runs an elseif statement on its own</td>
<td></td>
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
<td>Ensures that each if block has a corresponding `end;` if it is not followed by an else or elseif</td>
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
<td>declarations_positive.pt</td>
<td>Ensures that variable declarations using 'like' keyword are working properly</td>
<td>Runs various variable declarations with and without the 'like' keyword</td>
<td></td>
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
<td>shortFormAssignment_positive.pt</td>
<td>Ensures that short form assignments and associated arithmetic operations are  as expected</td>
<td>Runs all of the short form assignments as well as the equivalent assignment and operation statements to compare expected outputs</td>
<td></td>
<td></td>

<tr>
<td>shortFormAssignment_negative.pt</td>
<td>Ensures that short form assignments that are not syntactically correct output as expected</td>
<td>Runs all of the short form assignments with the assignment operator in the wrong spot</td>
<td></td>
<td></td>

<tr>
<td>token_defenitions.pt</td>
<td>Ensures that all tokens are properly emitted, whether their keyword is used, or the associated symbol</td>
<td>Runs through each token as well as it's symbol</td>
<td></td>
<td></td>

</table>
