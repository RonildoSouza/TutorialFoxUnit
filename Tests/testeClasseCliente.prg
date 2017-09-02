**********************************************************************
DEFINE CLASS testeClasseCliente as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS testeClasseCliente OF testeClasseCliente.PRG
	#ENDIF
	
	*  
	*  declare properties here that are used by one or
	*  more individual test methods of this class
	*
	*  for example, if you create an object to a custom
	*  THIS.Property in THIS.Setup(), estabish the property
	*  here, where it will be available (to IntelliSense)
	*  throughout:
	*
	ioCliente = .NULL.
*!*		icSetClassLib = SPACE(0)


	* the icTestPrefix property in the base FxuTestCase class defaults
	* to "TEST" (not case sensitive). There is a setting on the interface
	* tab of the options form (accessible via right-clicking on the
	* main FoxUnit form and choosing the options item) labeld as
	* "Load and run only tests with the specified icTestPrefix value in test classes"
	*
	* If this is checked, then only tests in any test class that start with the
	* prefix specified with the icTestPrefix property value will be loaded
	* into FoxUnit and run. You can override this prefix on a per-class basis.
	*
	* This makes it possible to create ancillary methods in your test classes
	* that can be shared amongst other test methods without being run as
	* tests themselves. Additionally, this means you can quickly and easily 
	* disable a test by modifying it and changing it's test prefix from
	* that specified by the icTestPrefix property
	
	* Additionally, you could set this in the INIT() method of your derived class
	* but make sure you dodefault() first. When the option to run only
	* tests with the icTestPrefix specified is checked in the options form,
	* the test classes are actually all instantiated individually to pull
	* the icTestPrefix value.

*!*		icTestPrefix = "Prefix"
	
	********************************************************************
	FUNCTION Setup
	********************************************************************
	*
	*  put common setup code here -- this method is called
	*  whenever THIS.Run() (inherited method) to run each
	*  of the custom test methods you add, specific test
	*  methods that are not inherited from FoxUnit
	*
	*  do NOT call THIS.Assert..() methods here -- this is
	*  NOT a test method
	*
    *  for example, you can instantiate all the object(s)
    *  you will be testing by the custom test methods of 
    *  this class:
*!*		THIS.icSetClassLib = SET("CLASSLIB")
*!*		SET CLASSLIB TO MyApplicationClassLib.VCX ADDITIVE
		THIS.ioCliente = NEWOBJECT('cliente', 'cliente.vcx')

	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
	********************************************************************
	*
	*  put common cleanup code here -- this method is called
	*  whenever THIS.Run() (inherited method) to run each
	*  of the custom test methods you add, specific test
	*  methods that are not inherited from FoxUnit
	*
	*  do NOT call THIS.Assert..() methods here -- this is
	*  NOT a test method
	*
    *  for example, you can release  all the object(s)
    *  you will be testing by the custom test methods of 
    *  this class:
*!*	    THIS.ioObjectToBeTested = .NULL.
*!*		LOCAL lcSetClassLib
*!*		lcSetClassLib = THIS.icSetClassLib
*!*		SET CLASSLIB TO &lcSetClassLib
		ioCliente = .NULL.      

	********************************************************************
	ENDFUNC
	********************************************************************	

	*
	*  test methods can use any method name not already used by
	*  the parent FXUTestCase class
	*    MODIFY COMMAND FXUTestCase
	*  DO NOT override any test methods except for the abstract 
	*  test methods Setup() and TearDown(), as described above
	*
	*  the three important inherited methods that you call
	*  from your test methods are:
	*    THIS.AssertTrue(<Expression>, "Failure message")
	*    THIS.AssertEquals(<ExpectedValue>, <Expression>, "Failure message")
	*    THIS.AssertNotNull(<Expression>, "Failure message")
	*  all test methods either pass or fail -- the assertions
	*  either succeed or fail
    
	*
	*  here's a simple AssertNotNull example test method
	*
	*********************************************************************
	FUNCTION TesteObjetoFoiCriado
	*********************************************************************
		THIS.AssertNotNull(THIS.ioCliente, ;
			"Objeto n�o foi instanciado na fun��o Setup()")
	*********************************************************************
	ENDFUNC
	*********************************************************************

	*
	*  here's one for AssertTrue
	*
	*********************************************************************
	FUNCTION TesteCompararValorMetodoRetornaCliente 
	*********************************************************************
		sNomeCliente = THIS.ioCliente.retornacliente()
		bResultado = sNomeCliente == ''
	
		THIS.AssertTrue(bResultado, "Teste Falhou")
	*********************************************************************
	ENDFUNC
	*********************************************************************

	*
	*  and one for AssertEquals
	*
	*********************************************************************
	FUNCTION TestObjectCustomMethodReturnValue 
	*********************************************************************

	* Please note that string Comparisons with AssertEquals are
	* case sensitive. 
		sNomeCliente = this.ioCliente.retornacliente()
		
		bResultado = THIS.AssertEquals('Cliente Teste', sNomeCliente)
		
		IF bResultado THEN 
			THIS.MessageOut(sNomeCliente)
		ENDIF
	*********************************************************************
	ENDFUNC
	*********************************************************************
	
*!*		AssertEquals(tuExpectedValue, tuExpression, tcMessage,tuNonCaseSensitiveStringComparison)
*!*		(AssertEquals now accepts objects as well as scalar variables)
*!*		AssertEqualsArrays(@taArray1, @taArray2, tcMessage)
*!*		AssertNotEqualsArrays(@taArray1, @taArray2, tcMessage)

*!*		AssertTrue(tuExpression, tcMessage)
*!*		AssertFalse(tuExpression, tcMessage)
*!*		AssertNotEmpty(tuExpression, tcMessage)
*!*		AssertNotNull(tuExpression, tcMessage)
*!*		AssertNotNullOrEmpty(tuExpression, tcMessage)

*!*		AssertIsObject(toObject, tcMessage)
*!*		AssertIsNotObject(toObject, tcMessage)

*!*		AssertHasError(tcMessage, toException, taStackInfo)
*!*		AssertHasErrorNo(tcMessage, toException, tnErrorNo, taStackInfo)

*!*		AssertNotImplemented(tcMessage)  (The new default return value for new tests)


**********************************************************************
ENDDEFINE
**********************************************************************
