<table>
<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output Filename</th>
<th>Notes</th>
</tr>

<tr>
<td>6_shortFormAssignment_positive.pt</td>
<td>Ensures that short form assignments and associated arithmetic operations are as expected</td>
<td>Runs all of the short form assignments as well as the equivalent assignment and operation statements to compare expected outputs</td>
<td>6_shortFormAssignment_positive.pt.eOutput</td>
</tr>

<tr>
<td>6_shortFormAssignment_negative.pt</td>
<td>Tests behaviour with mistyped shortform assignments</td>
<td>Runs all of the short form assignments with the assignment operator in the wrong spot.</td>
<td>DOUBLE CHECK OUTPUT WITH GROUP 6_shortFormAssignment_negative.pt.eOutput</td>
</tr>

<tr>
<td>6_repeatWhile_negative_no_condition.pt</td>
<td>Test parsing of repeat ... while statement without a condition following the 'while'</td>
<td>Small program with invalid repeat while loop, lacking condition after 'while'</td>
<td>6_repeatWhile_negative_no_condition.pt.eOutput</td>
</tr>

<tr>
<td>6_repeatWhile_positive.pt</td>
<td>Test parsing of valid repeat ... while statement with regular or (almost) empty bodies</td>
<td>Two while loops: one with a condition and body that will terminate, and one that would loop forever (empty body)</td>
<td>6_repeatWhile_positive.pt.eOutput</td>
</tr>

<tr>
<td>6_while_negative_no_body.pt</td>
<td>Test parsing of repeat while ... statement without anything after 'while'</td>
<td>Small program with invalid repeat while loop. No condition or block following 'while'</td>
<td>6_while_negative_no_condition.pt.eOutput</td>
</tr>

<tr>
<td>6_while_negative_no_condition.pt</td>
<td>Test parsing of repeat while ... statement without a condition following the 'while'</td>
<td>Small program with invalid repeat while loop, lacking condition after 'while', which jumps directly into loop body</td>
<td>6_while_negative_no_condition.pt.eOutput</td>
</tr>

<tr>
<td>6_while_negative_no_end.pt</td>
<td>Test parsing of repeat while ... loop which lacks the 'end;' to terminate the Block</td>
<td>Small program with invalid while loop (lacks 'end;'), followed by code that would otherwise be outside of the loop body</td>
<td>6_while_negative_no_end.pt.eOutput</td>
</tr>

<tr>
<td>6_while_positive.pt</td>
<td>Test parsing of valid repeat while ... statement with regular or (almost) empty bodies</td>
<td>Two while loops: one with a condition and body that will terminate, and one that would loop forever (empty body)</td>
<td>6_while_positive.pt.eOutput</td>
</tr>

</table>