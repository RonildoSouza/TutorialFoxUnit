**********************************************************************
DEFINE CLASS TesteFormCliente as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS TesteFormCliente OF TesteFormCliente.PRG
	#ENDIF
	
	frm = .NULL.
	
	********************************************************************
	FUNCTION Setup
	********************************************************************
	
		* Obtém uma instancia do formulário.
		* OBS.: Foi feito desta forma porque 
		* as funções de CreateObject e NewObject
		* não funcionaram
		DO FORM frmteste NAME Form1 NOSHOW
		this.frm = Form1
		
	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
	********************************************************************
	 
	 	* Finaliza o form
	 	this.frm.Release()
		this.frm = .NULL.
		
	********************************************************************
	ENDFUNC
	********************************************************************	
    
	
	*********************************************************************
	FUNCTION VerificaSeObjetoFormFoiCriado
	*********************************************************************
		
		* Teste unitário para verificar se a instancia 
		* do form foi criada.
		THIS.AssertNotNull(THIS.frm, ;
			"Objeto não foi instanciado na função Setup()")
			
	*********************************************************************
	ENDFUNC
	*********************************************************************
	
	
	*********************************************************************
	FUNCTION TesteFuncaoInstanciaCliente
	*********************************************************************
		
		* Testa a função instancia_cliente
		* existente no form
		oCliente = this.frm.instancia_cliente()
		THIS.AssertNotNull(oCliente)
		
	*********************************************************************
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TesteFuncaoPopulaList
	*********************************************************************
	
		* Testa a função popula_list
		* existente no form e verifica
		* se o ListBox possue itens
		THIS.frm.popula_list()	
		THIS.AssertTrue((this.frm.lstClientes.ListCount > 0))
		
	*********************************************************************
	ENDFUNC
	*********************************************************************
	
	*********************************************************************
	FUNCTION ValidaSeCheboxMarcado
	*********************************************************************

		bResultado = .F.
		IF this.frm.chkFox.Value == 1 THEN
			bResultado = .T.
		ENDIF
		
		this.AssertTrue(bResultado)
		
	*********************************************************************
	ENDFUNC
	*********************************************************************
	
	*********************************************************************
	FUNCTION ValidaSeCheboxDesmarcado
	*********************************************************************
		
		bResultado = .F.
		IF this.frm.chkFox.Value == 1 THEN
			bResultado = .T.
		ENDIF
				
		this.AssertFalse(bResultado)
		
	*********************************************************************
	ENDFUNC
	*********************************************************************

**********************************************************************
ENDDEFINE
**********************************************************************
