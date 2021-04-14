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
## General Changes
For all of the updates listed below:

- All changes in `semantic.ssl` have comments nearby indicating what was changed/what the new changes do
- All comments made by us in `semantic.ssl` are prefixed with `%%`, e.g. `%% This is an SSL comment`
- All changes in `semantic.pt` have comments nearby indicating what was changed/what the new changes do
- All comments made by us in `semantic.pt` start with `{##` and end with `##}`, e.g. `{## This is a PT comment ##}`

## Definitions
The following input tokens were added to `semantic.ssl` in order to match output tokens in `parser.ssl` exactly: 
```
        sPackage            % Added
        sPublic             % Added
        sConcatenate        % Added
        sRepeatString       % Added
        sSubstring          % Added
        sLength             % Added
        sInitialValue       % Added
        sCaseElse           % Added 
```
It should also be noted that the `sType` input token was changed to `sLike`.         
## Extensions to the T-Code Machine Model
tConcatenate, tRepeatString, tSubString, tLength, tChr, tOrd, tStringEQ, tInitialValue, tInitEnd, tCaseElse, and tCaseElseEnd were added in the Output section of `semantic.ssl` in the non-compound operations section, as they all do not take operand(s). All references to `sType` were changed to `sLike` to reflect the new semantic input token.

## Programs
In the `Program` rule, the `Block` call following the handling of program parameters was replaced with a call to `Statement` to allow nesting of program scopes.

A null program test file was created, `null_program.pt` within the testSuite to ensure the base case of a null program was working fine before proceeding.

## Block
All changes made in `semantic.ssl`. The `Block` rule was modified with the following changes:

Alternatives within the old `Statement` rule were added in the `Block` rule, within the selection loop. This is because in Like, declarations and statements can be mixed together which allows their handling to be called from the same rule, `Block`.

Recognition of the input token `sBegin` was moved to the beginning of the `Block` rule and `sEnd` was added at the end of the `Block` rule, outside the selection loop. This is because all sequences of declarations and statements are wrapped between `sBegin` and `sEnd` in the Like parser. Since the terminating `sEnd` was handled in the `Block` rule, the `BeginStmt` rule was unnecessary and removed. 
In the choices merged from `Statement`, `sBegin` handling was removed as it simply called the `BeginStmt` rule which was no longer needed.

The `Statement` rule was modified such that it pushes a new scope, calls `Block` and pops the corresponding scope. `oSymbolTblPushScope` was used to create a new table scope to differentiate variables outside the current scope, then called `@Block` to handle the declarations and statements, then `oSymbolTblPopScope` was used to pop that scope. In Like, this is necessary because sequences of declarations and statements defines their own scope.

## Variables & Types
All changes were made in `semantic.ssl`. 

`SimpleType` rule was completely rewritten to handle Like's type declarations. Firstly, we always expect an _sLike_ token. Then, we expect either an _sIdentifier_ or _sInteger_. 

- If we get an _sIdentifier_, we make sure it is not undefined and that it is a simple variable or constant symbol. Then, a new `TypeStack` entry is created with the same type info as the symbol corresponding to _sIdentifier_. It is possible for an _sNegate_ token to follow. If it does, then make sure the type of our new `TypeStack` entry is _tpInteger_, otherwise, emit a type mismatch error
- If we get an _sInteger_, push a new _tpInteger_ `TypeStack` entry, and link that entry to the standard _stdInteger_

`IndexType` rule was modified to handle Like's syntax for specification of arrays. In Like, the lower array bound is always 1 and never entered explicitly in a program. The upper array bound must be a constant or literal integer. To implement this, we

1. Push value of 1 onto `ValueStack` for the lower bound
2. Call the `ConstantValue` rule to get the constant upper bound (i.e. `arrayBound` in project description). This adds an entry on top of `ValueStack` (the value of the constant) and on top of `TypeStack` (the type of the constant)
3. We check to make sure the `TypeStack` entry is of type _tpInteger_. If it isn't, emit _eIntegerConstReqd_ and fix `ValueStack` by popping then calling the `ValuePushValuePlusOne` rule
4. Clean up the `TypeStack` by removing top `ConstantValue` entry
5. Enter array bounds (top two entries on `ValueStack`, with upper on top) into top `TypeStack` entry, which will be the entry correspeconding to the array we're processing
6. Check to ensure the array bounds we've set are valid (i.e. lower <= upper). If not, remove upper from `ValueStack` and create new upper by calling the `ValuePushValuePlusOne` rule, then enter array bounds again.
7. Clean up `ValueStack` by popping top two entries

Following this, processing continues as it would in PT Pascal by calling the `ComponentType` rule.

`ProcedureParameterType` rule was modified to expect Like clauses for type information. To do this, we simply make a call to our previously modified `SimpleType` rule. Then we perform a quick check to make sure that, if the parameter's symbol kind is a value parameter (_syVariable_), then the type of our `TypeStack` entry corresponding to the `SimpleType` call must be a scalar value. If it is not a scalar value, emit the _eNonScalarValParm_ error token, then fix the `TypeStack` entry by removing the non-scalar type entry and adding a _tpInteger_ entry as the default.

After this point, we have a valid `TypeStack` entry, which is entered into the type reference field of the `SymbolStack` entry. Following this, allocation and entry of the symbol into the `SymbolTable` occurs as in the standard PT Pascal compiler.

## Initial Values
All changes were made in `semantic.ssl`

To implement initial values for variables in Like, the `VariableDeclarations` rule was modified. After verifying the declared symbol is not already defined, we expect either an expression (Project Description section 4, _variableDeclaration_ __(a)__), or a declaration that terminates with a `like` statement (Project Description section 4, _variableDeclaration_ __(b)__). The former expression is an _initial value_. We differentiate between these two cases with the prescence (or lack thereof) a `sInitialValue` in the parser's output token stream. If we encounter said `sInitialValue` token, we know we have an initial value. 

In this case, we

1. Emit a `tInitialValue` token (this is a null operation for the abstract machine, but helps for organizational/debugging purposes later)
2. Call the `Expression` rule to translate the postfix expression into T-code. This verifies the validity of the expression (checks symbols are defined, operators are used correctly, etc.), creates an `syExpression` symbol on the symbol stack and a corresponding type stack entry which contains the type information of the expression result. 
3. Emit a `tInitEnd` to mark the end of our initial value expression
4. We don't need the expression symbol on the symbol stack, so we `oSymbolStkPop` (the symbol stack entry corresponding to our new variable is already on the stack from the `oSymbolStkPushLocalIdentifier` operation)
5. We check to make sure the expression's type is not `tpArray`, because we must assign a scalar (in Like, we allow the assignment of initial values of type `tpInteger`, `tpBoolean`, `tpChar`, and `tpFile`)
6. We'll make use of the top type stack entry to set the type refernce of this variable. First, the type entry needs to be linked to a standard type before it can be entered to the type table (`Expression` doesn't link resultant type entries). To fix this, a simple choice will `oTypeStkLinkToStandardType` appropriately
7. We can now call `EnterVariableAttributes`, which will (a) allocate space for our variable, (b) set the type reference of the symbol stack entry to our type entry, and (c) enter the symbol stack entry into the symbol table.
8. Lastly, we must T-code to assign the initial value to our variable. We emit the address of our variable, then call the `EmitStore` rule to emit the storage of our inital value

If we do not encounter `sInitialValue`, processing proceeds with a call to `TypeBody` to process the `like` statement, then `EnterVariableAttributes`.

After this has been done, we clean up the type stack and symbol stack with `oTypeStkPop` and `oSymbolStkPop`, respectively.
## Packages
A new rule called `PackageDefinition` was added to handle the Like languages declaration of packages with the `pkg` keyword. These changes were made in `semantic.ssl`.

A new symbol kind called `syPackage` of type `SymbolKind` was added to `semantic.ssl` and is called when `sPackage` is encountered from the `Block` rule. 

To support the `public` keyword for declarations in Like packages, an array of boolean flags were then added to both the Symbol and Stack tables in `semantic.pt`. These flags, `symbolStkPublicFlag` and `symbolTblPublicFlag` denote whether or not the constant, variable or function in question is public (i.e. exported declared identifier unqualified from the package to the enclosing scope). In order to set this flag, a new semantic operation called `oSymbolStkSetPublicFlag` was added to the `SymbolStk` mechanism in `semantic.ssl`. 

Next, the `ConstantDefinition`, `ProcedureDefinition` and `VariableDeclaration` rules were updated to check for the optional `sPublic` token following the declaration/definition, which sets the flag accordingly. 

Finally, a new semantic operation called `oSymbolTblMergePublicScope` was added to the `SymbolTbl` mechanism. We used the `oSymbolTblPopScope` mechanism as a base for this rule. This mechanism walks through all the symbols local to a scope and unlinks the identifier of each symbol unless said symbol has the corresponding public flag set (have the previously mentioned boolean flag in `symbolTblPublicFlag` set true). Unlike `oSymbolTblPopScope`, we do not pop entries from the symbol table or type table because doing so would remove said entries from the enclosing scope.

## Statements
All changes were made in `semantic.ssl`. No changes were necessary in the semantic phase for shortform assignments, repeat-while loops or elseif handling as the parser still emits the same tokens as if it were PT. 

Choose statements were masked as Case statements, and changes were made to the `CaseStmt` rule to recognize the optional _else_. After emitting the case branch table, a selection block was added to check for _sCaseElse_, an optional else clause. If there was an else clause, `tCaseElse` was emitted, the Statement rule was called to handle the expressions within it, and `tCaseElseEnd` was emitted to terminate the else block. If there is no else clause, the default option was taken which performed no action and continued to emit the merge branches for case alternatives. This was because in Like, else clauses in choose statements are optional and if there is the case table did not match an else clause, no necessary action is needed. 

## Strings and Constants

__In `semantic.pt`:__

`stringSize` was added to type `Integer` with a value of 256 bytes as it is now its own type.

The traps `trReadString` and `trWriteString` to `TrapKind` with a value of 108 and 109 respectively. This allows for proper IO for strings.

`tpString` was removed from `TypeKind` as it is no longer used.

The handling of strings in the `oAllocateVariable` was changed to the proper handling of `stringSize` for the `tpChar` case from the fake char arrays present in PT.

In `oAllocateVariable`, the handling of tpChar arrays was changed to handle `stringSize`, implementing arrays of strings.

`oValuePushChar` was changed to push `codeAreaEnd` to signify end of strings, since they are now longer than 1 character.

`oEmitString` was changed to emit a `0` token at the end of a string to allow for recognition of string bounds.

__In `semantic.ssl`:__

Removed all mentions and alternatives concerning `tpString` as it has been removed from the langauge.

Removed the handling of char arrays from `WriteText` and `AssignProcedure`. In both cases `stringSize` is pushed onto the value stack to give the length of the string. Also, occurences of tpString are replaced where needed with `tpChar` to ensure consistency in the token stream. `ReadText` rule was updated to use `trReadString` and `WriteText` rule was updated to use `trWriteString`.

The `StringLiteral` rule was changed to remove length 0 and length 1 cases. `tpChar` is pushed onto the Type Stack and a linking to the `stdChar` type. This replaces the pushing of a fake string char array.

The `Operand` rule was altered to emit `tLiteralAddress codeAddress` followed by `tFetchChar` in the `tpChar` case, this is done for the reasons listed above.

The `sStringLiteral` was added to the `SimpleType` rule, as it is now one of the true simple types.

## String Operations

All changes to implement string operations take place in `semantic.ssl`.

As an overview, we have the support the following string operations in Like:

- String length
- String concatenate
- String repeat
- String equality
- String inequality
- Substring

Note that this list excludes relational comparison operations like `<`, `<=`, `>`, and `>=`.

The specification above is implemented in a modular way across three rules, those being `UnaryOperator`, `BinaryOperator`, and `CompareRelationalOperandTypes`. These rules are always called within the context of the `Expression` rule, which will have interpreted the parser's postfix expression prior to calling the aforementioned operators. This will have created entries corresponding to the operands on the symbol and type stack. For this reason, when processing an operation in `UnaryOperator` or `BinaryOperator`, we work under the assumption that operand symbols and types exist on their respective stack. This also implies that operand order on the type and symbol stack is such that the final operand is on top.

The following list details the changes that were made to implement each operation.

1. __String Length__ _(#tpChar)_:
    - Implemented in `UnaryOperator`
    - If we encounter an `sLength` token, we know we have a string length operation. Emit the `tLength` T-code
    - Verify our (single) operand is a string `tpChar` with `oTypeStkChooseKind`. If it isn't, emit a `eOperandOperatorTypeMismatch` error
    - Pop the type stack entry (whether it was `tpChar` or not) and place a new entry of the result type, `tpInteger`
    - The choice exits and modifies the symbol stack entry (which previously corresponded with the operand) by `oSymbolStkSetKind` to `syExpression`
2. __String Concatenate__ _(tpChar | tpChar)_:
    - Implemented in `BinaryOperator`
    - If we encounter an `sConcatenate` token, we know it's a string concatenate operation. Emit the `tConcatenate` T-code
    - Because this operation has same operand types and reult type (all `tpChar`), we can use treat it similar to an `sAdd` operation. To do this, we push the result type `tpChar` with `oTypeStkPush` and call `CompareOperandAndResultTypes`
    - This rule verifies the two operands and result type (top three entries on type stack) are of the same type, leaves the result type on the type stack, removes one of two operand symbols and sets the remaining one to `syExpression`
3. __String Repeat__ _(tpChar || tpInteger)_:
    - Implemented in `BinaryOperator`
    - If we encounter an `sRepeatString` token, we know we have a string length operation. Emit the `tRepeatString` T-code
    - Verify our second operand is a string `tpInteger` with `oTypeStkChooseKind`. If it isn't, emit a `eOperandOperatorTypeMismatch` error
    - Pop the top type stack entry (whether it was `tpInteger` or not)
    - Verify our first operand is a string `tpChar` with `oTypeStkChooseKind`. If it isn't, emit a `eOperandOperatorTypeMismatch` error
    - Pop the type stack entry (whether it was `tpChar` or not) and place a new entry of the result type, `tpChar`
    - Clean up the symbol stack by popping second operand and modifying first to be `syExpression`
4. __String Equality__ _(tpChar == tpChar)_:
    - Implemented in `BinaryOperator`
    - If we encounter an `sEq` token, we know it is either a  `tEQ` or `tStringEQ` operation
    - Differentiate with `oTypeStkChooseKind`: If the first operand is of type `tpChar`, assume they both are and emit `tStringEQ`. Otherwise, emit `tEQ`
    - Allow previous call to `CompareEqualityOperandTypes`, which will verify both operands are of same type, then cleanup/set the type and symbol stacks such that the result is an `syExpression` of type `tpBoolean`
5. __String Inequality__ _(tpChar != tpChar)_:
    - Implemented in `BinaryOperator`
    - If we encounter an `sNE` token, we know it is either a  `tNE` or string inequality operation
    - Differentiate with `oTypeStkChooseKind`: If the first operand is of type `tpChar`, assume they both are and emit `tStringEQ` followed by `tNot`. Otherwise, emit `tEQ`
    - Allow previous call to `CompareEqualityOperandTypes`, which will verify both operands are of same type, then cleanup/set the type and symbol stacks such that the result is an `syExpression` of type `tpBoolean`
6. __Substring__ _(tpChar / tpInteger : tpInteger)_:
    - Implemented in `BinaryOperator`
    - If we encounter an `sSubstring` token, we know we have a string length operation. Emit the `tSubstring` T-code
    - Verify our third operand is a string `tpInteger` with `oTypeStkChooseKind`. If it isn't, emit a `eOperandOperatorTypeMismatch` error
    - Pop the top type stack entry (whether it was `tpInteger` or not)
    - Verify our second operand is a string `tpInteger` with `oTypeStkChooseKind`. If it isn't, emit a `eOperandOperatorTypeMismatch` error
    - Pop the top type stack entry (whether it was `tpInteger` or not)
    - Verify our first operand is a string `tpChar` with `oTypeStkChooseKind`. If it isn't, emit a `eOperandOperatorTypeMismatch` error
    - Pop the type stack entry (whether it was `tpChar` or not) and place a new entry of the result type, `tpChar`
    - Clean up the symbol stack by popping third and second operands, then modify the first to be `syExpression`
7. __Relational Comparisons__ _(<, <=, >, >=)_:
    - Implemented in `CompareRelationalOperandTypes`
    - Observe that all relational comparison operations (`sGT`, `sGE`, `sLT`, `sLE`) make a call to `CompareRelationalOperandTypes`. This rule verifies the operands are of the same type, having a seperate case for `tpChar` vs. other cases
    - By removing the `tpChar` case in the choice, we effectively force any relational comparisons between strings to the default choice, which which will emit `eOperandOperatorTypeMismatch` error

There are many optimizations that could be performed in these implementations, but we refrain from doing so as per the Phase 3 specification.

# Phase 3 Corrections

In `semantic.ssl`, it was noticed that the `TrapKind` entries had numbers that did not line up properly with those seen in `ptruntime/ptruntime.c`.

In the submission from Phase 3, the following was listed:

```ssl
type TrapKind :
    trHalt = 0
    trReset = 1
    trRewrite = 2
    trRead = 3
    trReadln = 4
    trWrite = 5
    trWriteln = 6
    trWriteInteger = 7
    trWriteChar = 8
    trReadInteger = 9
    trReadChar = 10
    trAssign = 11
    trReadString = 108 %% Added trReadString and trWriteString to deal with strings
    trWriteString = 109; 
```

Which has since been changed to:

```ssl
type TrapKind :
    trHalt = 0
    trReset = 1
    trRewrite = 2
    trRead = 3
    trReadln = 4
    trWrite = 5
    trWriteln = 6
    trWriteInteger = 8
    trWriteChar = 9
    trReadInteger = 10
    trReadChar = 11
    trAssign = 12
    trReadString = 108 %% Added trReadString and trWriteString to deal with strings
    trWriteString = 109; 
```

In lines 2579-2590 of `semantic.ssl`, incorrect field width defaults were specified for strings (_tpChar_). Previously, we had

```ssl
    % No field width specified, supply a default
    [ oTypeStkChooseKind    % of expression being written
        | tpInteger, tpSubrange:
            oValuePush(ten)
        %% Removing tpString alternatives as it is deprecated -T
        %% Replaced with tpChar and push stringSize -T
        | tpChar:
            oValuePush(stringSize)
        | *:        
            % error flagged below
            oValuePush(zero)
    ]
```

Which has since been changed to:

```ssl
    % No field width specified, supply a default
    [ oTypeStkChooseKind    % of expression being written
        | tpInteger, tpSubrange:
            oValuePush(ten)
        %% Removing tpString alternatives as it is deprecated -T
        %% Replaced with tpChar and push stringSize -T
        %% FIXED: We shouldn't have pushed stringSize. Should be 0
        | *:        
            % error flagged below
            oValuePush(zero)
    ]
```

# Phase 4 Documentation

## Semantic Phase Interface

The modified `ptruntime.c` was copied into `ptruntime/ptruntime.c`, which implements the string operations and traps for Like.

Semantic phase output tokens in `semantic.ssl` were copied in exact order to input tokens section of `coder.ssl`. Trap codes were updated within the _Integer_ type of `coder.ssl`, corresponding to all the traps in `ptruntime.c` to support Like string operations. The _string_ data kind was added to _Integer_ with a value of 3. The constant length of Like strings was also added to _Integer_, _twofiftysix_, with a value of 256.

The compiler was made, `*.def` outputs were copied as needed, and test programs were created and run to ensure existing language features work properly.

## Initial Values

The following changes were made in the _Block_ rule of `coder.ssl`.

A case alternative was added to handle _tInitialValue_. When this is encountered, we call the _OperandPushExpression_ rule to encode the expression of the initial value, then expect _tInitEnd_ followed by _tLiteralAddress_. This is the address of the variable we will store the expression in. This is pushed onto the operand stack. The top two operands are swapped (so that expression is on top, followed by variable), then the appropriate length and _OperandAssignXPopPop_ rule is called depending on the type of the T-code store instruction (e.g. _tStoreInteger_, _tStoreBoolean_).

## String Operations

The following changes were made in `coder.ssl`.

In the _OperandPushExpression_ and _OperandPushExpressionAssignPopPop_ rules
