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
<td>keywords.pt</td>
<td>Ensure that proper keyword tokens are being generated for new keywords, and not for identifiers or old keywords</td>
<td>Tests each keyword/identifier to see the output tokens</td>
<td>pChoose pElseif pFun pIs pLike pPkg pPublic pUsing pVal pWhen</td>
<td>pChoose pElseif pFun pIs pLike pPkg pPublic pUsing pVal pWhen</td>
</tr>

<tr>
<td>charclasses.pt</td>
<td>Ensure the new Like character classes are recognized by the scanner and output the correct token for the parser.</td>
<td>Forces newly added tokens through the screener to ensure character class is identified, and then through the scanner to recognize the token.</td>
<td>.pSlash .pSlashEquals .pPercent pPercentEquals .pHash .pBar .pDoubleBar .pNotEqual</td>
<td>.pSlash .pSlashEquals .pPercent pPercentEquals .pHash .pBar .pDoubleBar .pNotEqual</td>
</tr>

</table>
