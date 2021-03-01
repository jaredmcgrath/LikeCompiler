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

Else-if clauses were implemented by revising the `IfStmt` rule to recognize the optional 'elseif' token and terminating 'end' token, along with the original tokens recognized. No new semantic tokens were used - it was implemented to output a token stream equivalent to nested if statements. Before the optional `elseif` choice loop, the new `Block` rule is called rather than the old `Statement` rule. This is to parse sequences of declarations and statements which Like allows but Pascal did not. 

The `elseif` choice block is nested within a loop to allow for chained else-if clauses - which are allowed in the Like language. If the input token is an `elseif`, an `sElse` token is emitted, `sBegin` is emitted, the `IfStmt` rule is recursively called and the `sEnd` token is emitted to close the elseif clause. This is similar to a nested if statement, with the `sElse` token representing the outer else enclosing an inner if that will be emitted by calling `IfStmt` recursively. The recursive call to `IfStmt` will include a call to `Block` which will handle the parsing of the declarations and statements. If there is no elseif clause, the loop is simply exited because elseif clauses are optional. This is shown below:

```
{[
  | 'elseif':         
      .sElse
      .sBegin         
      @IfStmt         
      .sEnd
  | *:                
      >
]}

```

The `else` choice block from the original parser follows the new elseif choice loop shown above. The original call to `Statement` is changed to a call to the new `Block` rule for Like. Else statements are optional and thus, if there is no `else` token the choice does nothing. The `else` choice block is not in a loop because multiple else statements are illegal in Like. 

```
[                       
    | 'else':
        .sElse
        @Block          
    | *:
]
```

After the optional `elseif` and `else` choices, an `end` and `;` are expected. All if blocks are terminated by these tokens in Like. 


