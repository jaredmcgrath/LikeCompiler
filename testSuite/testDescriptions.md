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
<td> .pSlash .pNewLine .pSlashEquals .pNewLine .pPercent .pNewLine .pPercentEquals .pNewLine .pHash .pNewLine .pBar .pNewLine .pDoubleBar .pNewLine .pNotEqual .pEndFile</td>
<td> .pSlash .pNewLine .pSlashEquals .pNewLine .pPercent .pNewLine .pPercentEquals .pNewLine .pHash .pNewLine .pBar .pNewLine .pDoubleBar .pNewLine .pNotEqual .pEndFile</td>
</tr>

<tr>
<td>nonCompoundTokens.pt</td>
<td>Ensure Non-Compound Tokens are outputted as expected</td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td>stringTest.pt</td>
<td>Test the parsing of Like-style strings</td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td>comments.pt</td>
<td>Test the parsing of single line and multi-line comments</td>
<td></td>
<td></td>
<td></td>
</tr>

</table>
