# Pharo-Oracle-Call-Interface

This library allows you to connect 
to an [Oracle SQL RDBMS](https://www.oracle.com/database/) 
from [Pharo](https://pharo.org) (versions 8 and up).
It provides a binding with [Oracle's OCI](https://docs.oracle.com/en/database/oracle/oracle-database/21/lnoci/index.html) 
(also known as the [Oracle Call Interface](https://en.wikipedia.org/wiki/Oracle_Call_Interface)) using FFI.


## Usage

Once correctly installed on your local computer, you use OciClient to interact with the Oracle database:

```Smalltalk
| client rows |

client := OciClient new
  environmentString: 'pharotst202112_medium';
  username: 'SCOTT';
  password: 'TIGER';
  yourself.

rows := client query: 'SELECT * FROM emp'.  

client close.

rows.
```

There is also support for prepared statements with binding, check the unit tests for examples.


## Installation

To install this library you clone this repository and load BaselineOfPharoOracleCallInterface.
This can be done using the Iceberg UI tools and with the following script:

```Smalltalk
Metacello new
  baseline: 'PharoOracleCallInterface';
  repository: 'github://Ironirc/Pharo-Oracle-Call-Interface:main/';
  load.
```

You have to make sure that the Pharo VM can access/load 
the necessary native library for your client side OS platform.
The easiest way to get started is using [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client.html)
and an [Oracle Cloud](https://cloud.oracle.com) account.
You also have to set up and configure access, contact your DBA for help.


## Status

This project is new and currently under development.
It should not be used for production applications.
If you are interested please help out.
Basic queries are working on 32 and 64 bit Windows and 64 bit macOS.
