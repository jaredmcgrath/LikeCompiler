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

# Phase 2 Documentation

## Token Defenitions
All necessary token defenitions were added to `parser.ssl`, with their assoicated symbols. Notable changes included changing pNotEqual to '!=' instead of '<>', as well as changing sType to sLike. These changes are highlighted by comments in `parser.ssl`.

## Declarations
The parsing of the following PT type defenitions were removed: `TypeDefenitions`, `TypeBody` and `SimpleType` rules. The `ConstantDefenitions` rule was modified to handle comma separated lists. A new rule called `LikeClause` was created and allows for an array bound followed by a colon, and optional file keyword, the keyword like, and a variable or constant.

## Short Form Assignments
The parsing of the 'Like' short form assignment statements: +=, -=, *=, /= and %= was added. This was done by outputting the semantic toekn stream for a regular assignment so the semantic phase won't have to handle short form assignments. These changes can be seen in `parser.ssl` under the `AssignmentOrCallStmt` rule, with comments highlighting notable information. Finally, the ':=' symbol was changed to '=' for assignment.

## Packages

Packages were implemented by adding input choice of `'pkg'` to the `Block` rule in `parser.ssl`. This choice calls the new `Package` rule, which fully parses out any package based on the project specification, e.g.

```like
pkg package_name is
  // Package statements and declarations here
end;
```

Keyword identifier tokens were used to parse the package structure correctly, including `pIs`, `pEnd`, and `pSemicolon`.

## Choose

Choose statement was implemented by renaming `CaseStmt` rule to `ChooseStmt` rule and `CaseAlternative` rule to `ChooseAlternative` rule. In the `Block` rule, `'case'` was replaced with `'choose'`. The only notable change to the structure of `ChooseAlternative` was `Statement` became a `Block`. `ChoostStmt` was revised to reflect the changes in the syntax structure of case -> choose. The optional default `else` case was also added after `sCaseEnd` is emitted.

## Repeat While

Both types of loop statements were implemented by modifying the `Block` rule and revising the `'repeat'` input choice to do the following:

- If `'repeat'` is followed by `'while'`, we know it must be a `repeat while <expression> ...` statement, and so we call the `WhileStmt` rule
- For anything else following `'repeat'`, it must be a `repeat ... while <expression>` statement, so we call the `RepeatStmt` rule

Then, to each of these respective rules the following changes were made:

- The `WhileStmt` rule was modified to expect a `Block` following the expression. The `Block` handles the emission of `sBegin` and `sEnd`. Then `WhileStmt` expects a termination of the loop with `end;`
- The `RepeatStmt` now expects a `Block` immediately following the `'repeat'`. Once the parser encounters the `'while'` within the `Block` rule, the rule falls through back to `RepeatStmt`, which expects input of form `while <expression>;`. Since we are emitting the recycled `sRepeatStmt` token (which terminates on a truthy expression), we need to negate the expression before ending it. To do this, `sNot` is emitted before `sExpnEnd`

## String Type

The parsing of expressions was modified to recognize the new string operations (string concatenate `|`, string repeat `||`, substring `a / b : c`, and string length `#`). To implement correct parsing and operator precedence, the following changes were made:

- Concatenate and repeat were implemented in the `SimpleExpression` rule, following integer addition. Both operations are properly converted to postfix
- The substring operator (`a / b : c`) was implemented in `Term` rule following integer division. An input choice following `/` was required to differentiate between integer division (which doesn't have `:` following second `Factor`, `b`) and the substring operator itself. If `:` is encountered following the second `Factor`, `b`, then we expect a third `Factor`, `c`. After this, `sSubstring` is emitted in proper postfix notation
- The unary string length operator was implemented in the `Factor` rule alongside boolean `not`. When `'#'` is encountered, the next token is expected to be a `Factor`. Then `sLength` is emitted in proper postfix notation
TODO: Write this after finalizing the implementation

## Statement Sequences
`IfStmt` was revised to call the modified `Block` rule rather than the old `Statement` rule. This is because the `Statement` and `Block` rule from Pascal were combined and revised to form the `Block` rule. The new `Block` rule is called after emitting `sThen` to a) enclose the declarations and statements with `sBegin` and `sEnd` and to b) parse the declarations and statements within the if block. This allows the semantic phase to believe it is still handling regular PT while allowing for multiple statements and declarations in a single block, unlike in PT Pascal.

## Else-if

Else-if clauses were implemented by revising the `IfStmt` rule to recognize the 'elseif' token. No new semantic tokens were used - it was implemented to output a token stream equivalent to nested if statements. The choice block is nested within a loop to allow for chained else-if clauses - which are allowed in the Like language.

An `elseif`, `end` and default option were added to the selection block. `elseif` was added to recognize the new Like way of forming if statements. If the input token is an `elseif`, an `sElse` token is emitted, the `Block` rule is called, and the `IfStmt` rule is recursively called. This is similar to a nested if statement, with the `sElse` token representing the outer else enclosing an inner if that will be emitted by calling `IfStmt` recursively. The `Block` rule is called to emit the begin and end semantic tokens, to enclose the simulated if statement that will be parsed by the recursive call to `IfStmt` immediately after. This is shown below:

```
| 'elseif': %treat as nested if
  .sElse
  @Block %emits sBegin and sEnd
  @IfStmt %parse "inner if"

```

The `else` option was not changed as the emitted token, `sElse` remains the same in Like as in Pascal.

The `end` option was added to recognize the end of an if statement block. Within this option a semicolon is expected as the next input because Like includes semicolons as part of statements and declarations. Upon accepting a semicolon, the rule will exit as the if statement is concluded by the semicolon. This is shown below:

```
| 'end':
  ';'
  >
```

The default option was added to allow exiting of the recursive loop during recovery mode. Without this option, an incorrect if statement with no terminating `end` will run the loop in `IfStmt` infinitely due to the recursive call in the first alternative.
