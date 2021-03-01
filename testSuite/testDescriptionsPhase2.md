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
</table>
