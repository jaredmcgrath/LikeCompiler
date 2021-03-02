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
<td>.sProgram .sIdentifier .sParmEnd .sBegin .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sEnd
</td>
<td>.sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sVar
   .sIdentifier
     .sLike
      .sInteger
  .sEnd</td>
</tr>

<tr>
<td>program1Param.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for a single parameter</td>
<td>Declares a program with a single parameter with a single assignment inside</td>
<td> .sProgram .sIdentifier .sIdentifier .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sEnd</td>
<td> .sProgram
 .sIdentifier
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sVar
   .sIdentifier
     .sLike
      .sInteger
  .sEnd
</td>
</tr>

<tr>
<td>programsMultiParam.pt</td>
<td>Ensures that Like program yields the correct sequence of tokens for multiple parameters</td>
<td>Declares a program with mutliple parameters with a single assignment inside</td>
<td> .sProgram .sIdentifier .sIdentifier .sIdentifier .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sEnd</td>
<td> .sProgram
 .sIdentifier
 .sIdentifier
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sVar
   .sIdentifier
     .sLike
      .sInteger
  .sEnd</td>
</tr>

<tr>
<td>routinesBasic.pt</td>
<td>Ensures that a simple routine declaration yields the proper tokens</td>
<td>Declares a routine with a single declaration inside</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sNewLine .sEnd .sEnd</td>
<td> .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
    % .sNewLine
   .sEnd
  .sEnd
</td>
</tr>

<tr>
<td>routinesPublic.pt</td>
<td>Ensures that a simple public routine declaration yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sPublic .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sNewLine .sEnd .sEnd</td>
<td>  .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
  .sPublic
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
    % .sNewLine
   .sEnd
  .sEnd
</td>
</tr>

<tr>
<td>routinesBasic1Param.pt</td>
<td>Ensures that a simple routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a routine with a single declaration with 1 parameter inside</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sIdentifier .sVar .sLike .sInteger .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sNewLine .sEnd .sEnd</td>
<td> .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
    .sIdentifier
    .sVar
     .sLike
      .sInteger
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
    % .sNewLine
   .sEnd
  .sEnd
</td>
</tr>

<tr>
<td>routinesPublic1Param.pt</td>
<td>Ensures that a simple public routine declaration with 1 parameter yields the proper tokens</td>
<td>Declares a public routine with a single declaration inside and 1 parameter</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sPublic .sIdentifier .sVar .sLike .sInteger .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sNewLine .sEnd .sEnd
</td>
<td> .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
  .sPublic
    .sIdentifier
    .sVar
     .sLike
      .sInteger
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
    % .sNewLine
   .sEnd
  .sEnd
</td>
</tr>

<tr>
<td>routinesBasicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a routine with a single declaration inside and multiple parameters</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sIdentifier .sVar .sLike .sInteger .sIdentifier .sVar .sLike .sInteger .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sNewLine .sEnd .sEnd
</td>
<td> .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
    .sIdentifier
    .sVar
     .sLike
      .sInteger
    .sIdentifier
    .sVar
     .sLike
      .sInteger
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
    % .sNewLine
   .sEnd
  .sEnd
</td>
</tr>

<tr>
<td>routinesPublicMultiParam.pt</td>
<td>Ensures that a simple routine declaration with multiple parameters yields the proper tokens</td>
<td>Declares a public with a single declaration inside and multiple parameters</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sPublic .sIdentifier .sVar .sLike .sInteger .sIdentifier .sVar .sLike .sInteger .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sNewLine .sEnd .sEnd
</td>
<td> .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
  .sPublic
    .sIdentifier
    .sVar
     .sLike
      .sInteger
    .sIdentifier
    .sVar
     .sLike
      .sInteger
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
    % .sNewLine
   .sEnd
  .sEnd
</td>
</tr>

<tr>
<td>routinesNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a routine with no end and a single declaration</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sEnd
</td>
<td> .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
   .sEnd
</td>
</tr>

<tr>
<td>routinesPublicNoEnd_negative.pt</td>
<td>Ensures that the parser will not add an sEnd token if there is not the requisite end statement in the routine</td>
<td>Declares a public routine with no end and a single declaration</td>
<td> .sProgram .sIdentifier .sParmEnd .sNewLine .sBegin .sProcedure .sIdentifier .sPublic .sParmEnd .sNewLine .sBegin .sVar .sIdentifier .sLike .sInteger .sEnd
</td>
<td> .sProgram
 .sIdentifier
 .sParmEnd
 % .sNewLine
  .sBegin
  .sProcedure
  .sIdentifier
  .sPublic
   .sParmEnd
  % .sNewLine
   .sBegin
   .sVar
    .sIdentifier
      .sLike
       .sInteger
   .sEnd
</td>
</tr>

<tr>
<td>File</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected</td>
<td>Actual</td>
</tr>

<tr>
<td>File</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected</td>
<td>Actual</td>
</tr>

</table>
