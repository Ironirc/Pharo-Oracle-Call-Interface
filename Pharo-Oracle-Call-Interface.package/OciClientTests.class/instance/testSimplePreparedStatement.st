tests
testSimplePreparedStatement

	| statement rows |
	self dropTable: 'table1'.
	client execute:
		'CREATE TABLE table1 (id number(10), name VARCHAR2(10))'.
	statement := client prepare:
		             'INSERT INTO table1( id, name) VALUES (?, ?)'. "why not already prepare & cache immediately ?"
	statement doWhilePrepared: [ 
		statement executeAndReturnRowsWithInput: #( 666 'devlish' ) ].
	"	statement doWhilePrepared: [ 
		statement executeAndReturnRowsWithInput: #( 2 'two' ) ]."
	"	statement
		doWhilePrepared: [ 
		statement executeAndReturnRowsWithInput: #( 3 'three' ) ]
		shouldCache: false."
	statement close. "I added this before"
	statement := client prepare: 'SELECT name FROM table1 where id = ? '.
	statement
		doWhilePrepared: [ 
		rows := statement executeAndReturnRowsWithInput: #( 666 ) ]
		shouldCache: false.
	self assert: rows first equals: #( 'devlish' ).
	self dropTable: 'table1'