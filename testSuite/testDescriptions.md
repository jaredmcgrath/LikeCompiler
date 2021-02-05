# Test Descriptions

<table>
<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output</th>
</tr>

<tr>
<td>charclasses.pt</td>
<td>Ensure the new Like character classes are recognized by the scanner and output the correct token for the parser.</td>
<td>Forces newly added tokens through the screener to ensure character class is identified, and then through the scanner to recognize the token.</td>
<td>.pSlash .pSlashEquals .pPercent pPercentEquals .pHash .pBar .pDoubleBar .pNotEqual</td>
</tr>

</table>
