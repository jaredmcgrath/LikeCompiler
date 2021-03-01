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
<td>program.pt</td>
<td>Ensures that Like main program yields the correct sequence of tokens</td>
<td>Declares a program with a single assignment inside</td>
<td></td>
<td></td>
</tr>

<tr>
<th>programMultiParam.pt</th>
<th>Ensures that Like program yields the correct sequence of tokens for multiple parameters</th>
<th>Declares a program with mutliple parameters with a single assignment inside</th>
<th></th>
<th></th>

<tr>
<th>program1Param.pt</th>
<th>Ensures that Like program yields the correct sequence of tokens for a single parameter</th>
<th>Declares a program with a single parameter with a single assignment inside</th>
<th>Expected Output</th>
<th>Actual Output</th>

<tr>
<th>routinesBasic.pt</th>
<th>Ensures that a simple routine declaration yields the proper tokens</th>
<th>Declares a routine with a single declaration inside</th>
<th>sProcedure
sIdentifier
sParmEnd
sBegin
DECLARATIONS
sEnd</th>
<th>Actual Output</th>

<tr>
<th>routinesBasic1Param.pt</th>
<th>Ensures that a simple routine declaration with 1 parameter yields the proper tokens</th>
<th>Declares a routine with a single declaration with 1 parameter inside</th>
<th>sProcedure
sIdentifier
sPublic
sParmEnd
sBegin
DECLARATIONS
sEnd</th>
<th>Actual Output</th>

<tr>
<th>routinesPublic1Param.pt</th>
<th>Ensures that a simple public routine declaration with 1 parameter yields the proper tokens</th>
<th>Declares a public routine with a single declaration inside and 1 parameter</th>
<th>sProcedure
sIdentifier
sPublic
sParmEnd
sBegin
DECLARATIONS
sEnd</th>
<th>Actual Output</th>

<tr>
<th>routinesPublicMultiParam.pt</th>
<th>Ensures that a simple public routine declaration with multiple parameters yields the proper tokens</th>
<th>Declares a public routine with a single declaration inside and multiple parameters</th>
<th>sProcedure
sIdentifier
sPublic
sParmEnd
sBegin
DECLARATIONS
sEnd</th>
<th>Actual Output</th>

<tr>
<th>routinesPublicMultiParam.pt</th>
<th>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</th>
<th>Declares a public with a single declaration inside and multiple parameters</th>
<th>sProcedure
sIdentifier
sPublic
sParmEnd
sBegin
DECLARATIONS
sEnd</th>
<th>Actual Output</th>

<tr>
<th>NAME</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output</th>
<th>Actual Output</th>

<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output</th>
<th>Actual Output</th>

<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output</th>
<th>Actual Output</th>

<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output</th>
<th>Actual Output</th>

</table>
