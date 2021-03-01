# Test Descriptions

For concision, some tokens not relevant to each test were omitted from the expected/actual output. See the corresponding `.eOutput` files for full output.

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
<td>nonCompoundTokens.pt</td>
<td>Ensure the new Like non-compound tokens are recognized by the scanner and output the correct token for the parser.</td>
<td>Forces newly added tokens through the screener to ensure character class is identified, and then through the scanner to recognize the token.</td>
<td>  .pSlash
 .pPercent
 .pHash
 .pOrBar
 .pDoubleOrBar
 .pPlusEquals
 .pMinusEquals
 .pStarEquals
 .pSlashEquals
 .pPercentEquals
 .pDoubleEquals</td>
<td> .pSlash
 .pPercent
 .pHash
 .pOrBar
 .pDoubleOrBar
 .pPlusEquals
 .pMinusEquals
 .pStarEquals
 .pSlashEquals
 .pPercentEquals
 .pDoubleEquals</td>
</tr>

<tr>
<td>stringTest.pt</td>
<td>Test the parsing of Like-style strings</td>
<td>Incomplete program with 3 string literals</td>
<td>  .pStringLiteral
  % Output token text 'foo'
  .pStringLiteral
  % Output token text '"foo"'
  .pStringLiteral
  % Output token text ''</td>
<td>  .pStringLiteral
  % Output token text 'foo'
  .pStringLiteral
  % Output token text '"foo"'
  .pStringLiteral
  % Output token text ''</td>
</tr>

<tr>
<td>comments.pt</td>
<td>Test the parsing of single line and multi-line comments</td>
<td>Incomplete program with some examples of comments. Output demonstrates the correct number of .pNewline tokens are emitted</td>
<td>  .pNewLine
 .pNewLine
  .pNewLine
  .pNewLine
  .pNewLine
  .pNewLine
  .pNewLine
 .pNewLine
 .pEndFile</td>
<td>  .pNewLine
 .pNewLine
  .pNewLine
  .pNewLine
  .pNewLine
  .pNewLine
  .pNewLine
 .pNewLine
 .pEndFile</td>
</tr>

</table>
