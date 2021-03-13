# Phase 1 Documentation

## Keywords

Keywords [array, begin, case, const, div, do, mod, procedure, program, type, until] were removed and [choose, elseif, fun, is, like, pkg, public, using, val, when] were added. This was accomplished by editing the stdIdentifiers file in the parser subdirectory. Corresponding tokens were added/removed in scan.ssl as well (pChoose for the choose keyword).

Predefined identifiers were changed as well, [get, getln, put, putln] were added while [read, readln, write, writeln] were removed.

## Character Classes

Five new character classes were added to scan.ssl for the new Like inputs, and the existing lQuote class was changed to recognize double quotes rather than single. The following table describes the new Like inputs and their corresponding character class name. Character classes were added and altered in scan.ssl in the input declaration. 
<table>
<tr>
<th>Character</th>
<th>Character Class</th>
</tr>

<tr>
<td>"</td>
<td>lQuote</td>
</tr>

<tr>
<td>/</td>
<td>lSlash</td>
</tr>

<tr>
<td>%</td>
<td>lPercent</td>
</tr>

<tr>
<td>#</td>
<td>lHash</td>
</tr>

<tr>
<td>!</td>
<td>lBang</td>
</tr>

<tr>
<td>|</td>
<td>lBar</td>
</tr>
</table>

## Syntax Tokens
The following new Like symbols were added to `scan.ssl`:
<table>
<tr>
<th>Symbol</th>
<th>Syntax token</th>
</tr>

<tr>
<td>||</td>
<td>pDoubleOrBar</td>
</tr>

<tr>
<td>+=</td>
<td>pPlusEquals</td>
</tr>

<tr>
<td>-=</td>
<td>pMinusEquals</td>
</tr>

<tr>
<td>*=</td>
<td>pStarEquals</td>
</tr>

<tr>
<td>/=</td>
<td>pSlashEquals</td>
</tr>

<tr>
<td>%=</td>
<td>pPercentEquals</td>
</tr>

<tr>
<td>==</td>
<td>pDoubleEquals</td>
</tr>
</table>
Rules were added in order to emit these new syntax tokens when appropriate.
<br>
<br>

The initialization of the character class map was changed in the Initialize procedure of parser.pt. The map at indices corresponding to the ASCII codes of the new characters were initialized with the name of the character class using the 'ord' function. These changes allow the new characters to be pre-screened into character classes and further, scanned as legal tokens within the Like language. 

## Strings

Phase 1 string changes were implemented by changing the `quote` from `'` to `"` in `parser/parser.pt`

## Comments

The existing `Comment` and `AlternateComment` rules in `parser/scan.ssl` were removed. Two new rules, `SingleLineComment` and `MultiLineComment`, were added instead to discard

```like
// Single line comments, and

/*
 * multi-line comments
 */
```

The `Scan` rule was also adjusted to support these changes by first removing the old style `AlternateComment` and then by adding calls to the new comment rules for the `/` character.


# Phase 1 Corrections

The following changes were made to correct mistakes made in Phase 1:

## pDot and pDotDot

1. In `scan.ssl`, `pDot` and `pDotDot` were removed as output tokens, because they are no longer recognized in Like.
2. In `scan.ssl`, the option of '.' is removed in the `Scan` rule because it should not recognize it as a valid input to the scanner in Like or emit any valid token in response to it. By removing the entire '.' option, emitting `pDotDot` was also removed. 
3. In `parser.ssl`, `pDot` and `pDotDot` were removed as input tokens, because they would never be output by the scanner. If they were, it would be an error. 

## pColonEquals

1. In `scan.ssl`, `pColonEquals` was removed from the output tokens because it is not valid in Like.
2. In `scan.ssl` in the `Scan` rule, the ':' choice was changed. When a colon is the next input token, a `pColon` token is emitted. Previously, this triggered a choice between an equals sign and any other symbol - to recognize ':='. However, the choice block was removed and replaced with emitting `pColon` when a colon is the next input. This is because ':=' is no longer recognized in Like.

## pBang

1. In `scan.ssl` in the `Scan` rule, the '!' choice was changed by adding a choice block with two options. The first option is what was initally done in Phase 1, where if the next input token is '=' then `pNotEqual` was emitted. The second option is a default case because the '!' character cannot appear on its own unless it is inside a comment. In the default case, an error token is emitted. 

# Phase 2 Documentation
All changes (unless otherwise specified) were made to the parser.ssl file.
Contents of `parser.def` were copied and pasted into `parser.pt` to ensure token consistency.

## Programs

In order to allow for intermixed statements and declarations in Like, the `Statement` and `BeginStmt` rules alternatives were merged into the `Block` rule. Here, the emission of the `sBegin` and `sEnd` tokens were retained in order to minimize changes to the semantic phase, though the parsing of the `begin` and `end` tokens were removed.

The `Program` rule was modified in order to meet the new like specification. Specifically, changing the keyword to `'using'` and remvoing the encasing round brackets `'( ... )'` from PT. Additionally, the `'.'` operator at the end of the `Program` rule was removed as it is no longer used. The program name `pIdentifier` was also removed as it is not part of the Like language spec.

## Routines

The `ProcedureHeading` rule in `parser.ssl` was changed to allow for comma separation between parameters, instead of the semicolon separators from PT. This rule accepts zero or more parameter declarations.

In the `Block` rule, an alternative was created to handle the optional `'public'` keyword for routines, as well as others such as vars etc. (discussed below). The `pPublic` token is emitted in the proper sequence as per the Like specification documentation. 

The `procedure` alternative within the `Block` rule was changed to `fun` in order to comply with Like language specification. In addition, the alternative includes the parsing of the `pIs` token because Like expects `is` following the function name.

`ParameterDeclaration` rule was added in order to make rules more modular. This rule handles the parsing of each parameter and is called from the `ProcedureHeading` rule for each parameter in a given routines procedure heading. The `LikeClause` rule (discussed in _Declarations_ below) is then called in order to parse each like clause.

## Token definitions

The following tokens were added to `parser.ssl` in the __Input__ token section, with their assoicated symbols:
```
        pSlash                  '/'
        pPercent                '%'
        pHash                   '#'
        pOrBar                  '|'
        pDoubleOrBar            '||'
        pPlusEquals             '+='
        pMinusEquals            '-='
        pStarEquals             '*='
        pSlashEquals            '/='
        pPercentEquals          '%='
        pDoubleEquals           '=='
```
The following symbols for associated tokens were added to `parser.ssl` in the __Input__ token section:
```
        pElseif                 'elseif'        
        pFun                    'fun'
        pIs                     'is'
        pLike                   'like'
        pPkg                    'pkg'
        pPublic                 'public'
        pUsing                  'using'
        pVal                    'val'
        pWhen                   'when'
```
The following tokens were added to `parser.ssl` in the __Output__ token section, with their assoicated symbols:
```
        sPackage
        sPublic
        sConcatenate
        sRepeatString
        sSubstring
        sLength
        sInitialValue
        sCaseElse
```

Notable changes included changing pNotEqual to '!=' instead of '<>' (in __Input__), as well as changing sType to sLike (in __Output__). These changes are highlighted by comments in `parser.ssl`. This was needed as Like uses != for not equals, and accepts the Like keyword as a type in place of pt pascal type declarations.

## Declarations

The parsing of the following PT type definitions were removed: `TypeDefinitions`, `TypeBody` and `SimpleType` rules. This was necessary as the like parser no longer evaluates type declarations.

The `ConstantDefinitions` rule was modified to handle comma separated lists of constant declarations, e.g., `val x = 1, y = 2;`. The `VariableDeclarations` rule was modified to call `ValueOrLike` instead of the old `typeBody` call and only 1 variable declaration is permitted in a single `VariableDeclarations` rule call. The `ValueOrLike` rule was created to check for optional array bounds and set an initial value for declared variables or call the `LikeClause` when the Like keyword is used. A new rule called `LikeClause` was created to parse the Like clause for modularity.

## Short Form Assignments

The parsing of the 'Like' short form assignment statements: `+=`, `-=`, `*=`, `/=` and `%=` were added in a choice block, with each option emitting its respective tokens:
```
| '+=':                 % Added all choices below
    .sAssignmentStmt
    .sIdentifier
    .sIdentifier
    @Expression
    .sAdd
    .sExpnEnd
| '-=':
    .sAssignmentStmt
    .sIdentifier
    .sIdentifier
    @Expression
    .sSubtract
    .sExpnEnd
| '*=':
    .sAssignmentStmt
    .sIdentifier
    .sIdentifier
    @Expression
    .sMultiply
    .sExpnEnd
| '/=':
    .sAssignmentStmt
    .sIdentifier
    .sIdentifier
    @Expression
    .sDivide
    .sExpnEnd
| '%=':
    .sAssignmentStmt
    .sIdentifier
    .sIdentifier
    @Expression
    .sModulus
    .sExpnEnd
```

This was done by outputting the semantic token stream for a regular assignment so the semantic phase won't have to handle short form assignments. These changes can be seen in the `AssignmentOrCallStmt` rule. Finally, the `:=` symbol was changed to `=` for assignment because Like recognizes `=` as the assignment operator.

## Packages

Packages were implemented by adding input choice of `'pkg'` to the `Block` rule. This choice calls the new `Package` rule, which fully parses out any package based on the project specification, e.g.

```like
pkg package_name is
  // Package statements and declarations here
end;
```

Keyword identifier tokens were used to parse the package structure correctly, including `pIs`, `pEnd`, and `pSemicolon`.

## Choose

Choose statement was implemented by renaming `CaseStmt` rule to `ChooseStmt` rule and `CaseAlternative` rule to `ChooseAlternative` rule. In the `Block` rule, PT Pascal's `'case'` was replaced with Like's `'choose'`. The only notable change to the structure of `ChooseAlternative` was `Statement` became a `Block`. `ChooseStmt` was revised to reflect the changes in the syntax structure of case -> choose. That is, each `ChooseAlternative` is preceded by a `when`, and there must be at least one `ChooseAlternative` in a `ChooseStmt`. The optional default `else` case was also added after `sCaseEnd` is emitted in the `ChooseStmt` rule.

## Repeat While

Both types of loop statements were implemented by modifying the `Block` rule and revising the `'repeat'` input choice to do the following:

- If `'repeat'` is followed by `'while'`, we know it must be a `repeat while <expression> ...` statement, and so we call the `WhileStmt` rule
- For anything else following `'repeat'`, it must be a `repeat ... while <expression>` statement, so we call the `RepeatStmt` rule

Then, to each of these respective rules the following changes were made:

- The `WhileStmt` rule was modified to expect a `Block` following the expression. The `Block` handles the emission of `sBegin` and `sEnd`. Then `WhileStmt` expects a termination of the loop with `end;`
- The `RepeatStmt` now expects a `Block` immediately following the `'repeat'`. As the parser is parsing the `Block`, it will eventually encounter the `'while'`, which causes the parser to return to `RepeatStmt`. Following this, `sRepeatEnd` is emitted, then we expect the expression in `while <expression>;`. Since we are emitting the recycled `sRepeatStmt` token (which terminates when the expression becomes true), we need to negate the expression before ending it. To do this, `sNot` is emitted before `sExpnEnd`

## String Type

The parsing of expressions was modified to recognize the new string operations (string concatenate `|`, string repeat `||`, substring `a / b : c`, and string length `#`). To implement correct parsing and operator precedence, the following changes were made:

- Concatenate and repeat were implemented in the `SimpleExpression` rule, following integer addition. Both operations are properly converted to postfix
- The substring operator (`a / b : c`) was implemented in `Term` rule following integer division. An input choice following `/` was required to differentiate between integer division (which doesn't have `:` following second `Factor`, `b`) and the substring operator itself. If `:` is encountered following the second `Factor`, `b`, then we expect a third `Factor`, `c`. After this, `sSubstring` is emitted in proper postfix notation
- The unary string length operator was implemented in the `Factor` rule alongside boolean `not`. When `'#'` is encountered, the next token is expected to be a `Factor`. Then `sLength` is emitted in proper postfix notation

## Statement Sequences

`IfStmt` was revised to call the modified `Block` rule rather than the old `Statement` rule. This is because the `Statement` and `Block` rule from Pascal were combined and revised to form the `Block` rule. The new `Block` rule is called after emitting `sThen` to a) enclose the declarations and statements with `sBegin` and `sEnd` and to b) parse the declarations and statements within the if block. This allows the semantic phase to believe it is still handling regular PT while allowing for multiple statements and declarations in a single block, unlike in PT Pascal.

## Else-if

Else-if clauses were implemented by revising the `IfStmt` rule to recognize the optional 'elseif' token and terminating 'end' token, along with the original tokens recognized. These changes were made in `parser.ssl`. No new semantic tokens were used - it was implemented to output a token stream equivalent to nested if statements.  

The following changes were made:
1. Old `Statement` rule call before the choice block was replaced by a call to the `Block` rule - this occurs immediately after accepting `then` and emitting `sThen`. This is to handle the new statement and declaration sequences allowed in Like, along with other syntactic differences. 
2. `elseif` option was added as the first alternative in the choice block. Else-if clauses were treated like nested if statements. If the input token is an `elseif`, an `sElse` and `sBegin` is emitted, and the `IfStmt` rule is recursively called. Then the `sEnd` token is emitted to close the elseif clause. This is similar to a nested if statement, with the `sElse` token representing the outer else enclosing an inner if that will be emitted by calling `IfStmt` recursively. The recursive call to `IfStmt` will include a call to `Block` which will handle the parsing of the declarations and statements. The `elseif` option precedes the `else` option because if an else statement is used, it would be at the end of the if block. This is shown below:

```
| 'elseif':         
    .sElse
    .sBegin         
    @IfStmt         
    .sEnd
```
3. `else` option was retained in the choice block. The old call to `Statement` was changed to a call to the updated `Block`. Acceptance of `pEnd` and `pSemicolon` tokens follow the call to `Block` because in Like, if blocks are ended with "end;". If entering the `else` alternative, then we must expect an "end;" after because multiple else statements are not allowed. 

```                     
| 'else':
    .sElse
    @Block
    pEnd pSemicolon          
```
4. If there are no else-if or else statements, then the default case is that the if statement is expected to be terminated with "end;". 
```
|*:
    pEnd pSemicolon
```

## Operator Syntax

PT operator syntax was altered slightly to comply with Like language specification. Specifically:
<table>
<tr>
<th>
Old PT Pascal Operator
</th>
<th>
New Like Operator
</th>
<th>
Location of Change
</th>
</tr>
<tr>
<td>
div
</td>
<td>
/
</td>
<td>
Term rule
</td>
</tr>
<tr>
<td>
mod
</td>
<td>
%
</td>
<td>
Term rule
</td>
</tr>
<tr>
<td>
:=
</td>
<td>
=
</td>
<td>
AssignmentOrCallStmt rule
</td>
</tr>
<tr>
<td>
<>
</td>
<td>
!=
</td>
<td>
Expression rule
</td>
</tr>
<tr>
<td>
=
</td>
<td>
==
</td>
<td>
Expression rule
</td>
</tr>
</table>

# Phase 3 Documentation
## Extensions to the T-Code Machine Model
THIS IS A CHANGE LOG AND NOT A GOOD COPY OF DOCUMENTATION IM WORKING AS I GO HEHE
tFetchChar, tAssignChar, tStoreChar, tSubscriptChar were pre-existing in `semantic.ssl`
tConcatenate, tRepeatString, tSubString, tLength, tChr, tOrd, tStringEQ, tInitialValue, tInitEnd, tCaseElse, and tCaseElseEnd were added in the Output section of `semantic.ssl` in the non-compound operations section, as they all do not take operand(s).
* on Line 807 I change sType to sLike bc it wouldn't let me compile

## Programs
A null program test file was created, `null_program.pt` within the testSuite. 
* It compiled successfully and I don't know how to read the output lol