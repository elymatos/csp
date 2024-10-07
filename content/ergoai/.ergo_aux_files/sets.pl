
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYnone
#define INHERITANCEflogic
#define TABLINGreactive
#define TABLINGvariant
#define CUSTOMnone

#define FLORA_INCREMENTAL_TABLING 

/************************************************************************
  file: headerinc/flrheader_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader.flh"
#include "flora_porting.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrheader_prog_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader_prog.flh"

/***********************************************************************/

#define FLORA_COMPILATION_ID 32

/************************************************************************
  file: headerinc/flrheader2_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
  It has files that must be included in the header and typically
  contain some Prolog statements. Such files cannot appear
  in flrheader.flh because flrheader.flh is included in various restricted
  contexts where Prolog statements are not allowed.

  NOT included in ADDED files (compiled for addition) -- only in LOADED
  ones and in trailers/patch
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

%% flora_tabling_methods is included here to affect preprocessing of
%% flrtable/flrhilogtable.flh dynamically
#include "flora_tabling_methods.flh"

/* note: inside flrtable.flh there are checks for FLORA_NONTABLED_DATA_MODULE
   that exclude tabling non-signature frames
*/
#ifndef FLORA_NONTABLED_MODULE
#include "flrtable.flh"
#endif

/* if normal tabled module, then table hilog */
#if !defined(FLORA_NONTABLED_DATA_MODULE) && !defined(FLORA_NONTABLED_MODULE)
#include "flrhilogtable.flh"
#endif

#include "flrtable_always.flh"

#include "flrauxtables.flh"

%% include list of tabled predicates
#mode save
#mode nocomment "%"
#if defined(FLORA_FLT_FILENAME)
#include FLORA_FLT_FILENAME
#endif
#mode restore

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdyna_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

#include "flrdyndeclare.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrindex_P_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrindex_P.flh"

/***********************************************************************/

#mode save
#mode nocomment "%"
#define FLORA_THIS_FILENAME  'sets.ergo'
#mode restore
/************************************************************************
  file: headerinc/flrdefinition_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrdefinition.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrtrailerregistry_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailerregistry.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrrefreshtable_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrrefreshtable.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdynamic_connectors_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrdynamic_connectors.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrimportedcalls_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

%% Loads the file with all the import statements for predicates
%% that must be known everywhere

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBIMPORTEDCALLS))).

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpatch_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrexportcheck.flh"
#include "flrpatch.flh"
/***********************************************************************/

/************************************************************************
  file: headerinc/flropposes_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flropposes.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrhead_dispatch_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrhead_dispatch.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flraggcount_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCOUNT))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrclause_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCLAUSE))).

/***********************************************************************/

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'sets.fdb'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FDB_FILENAME,FLORA_THIS_MODULE_NAME,'fdb'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FDB_FILENAME,FLORA_THIS_FDB_STORAGE))).
#endif

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'sets.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(sets,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'sets.fld'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLD_FILENAME,FLORA_THIS_MODULE_NAME,'fld'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FLD_FILENAME,FLORA_THIS_FLD_STORAGE))).
#endif

 
#if !defined(FLORA_FLS_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS_FILENAME  'sets.fls'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS_FILENAME,FLORA_THIS_MODULE_NAME,'fls'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-(FLORA_THIS_WORKSPACE(static^neg^tblflapply)(equal,___newomnivar2,___newomnivar1,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(4,'sets.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar7,__newcontextvar8)),','('_$_$_ergo''rule_enabled'(4,'sets.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar2,___newomnivar1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)))).
:-(FLORA_THIS_WORKSPACE(static^neg^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar13,__newcontextvar14)),','('_$_$_ergo''rule_enabled'(6,'sets.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar2,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3))))).
:-(FLORA_THIS_WORKSPACE(static^neg^tblflapply)(equal,___newomnivar2,___newomnivar3,'_$ctxt'(_CallerModuleVar,__newcontextvar15,__newcontextvar16)),','('_$_$_ergo''rule_enabled'(6,'sets.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(equal,___newomnivar1,___newomnivar3,'_$ctxt'(_CallerModuleVar,__newcontextvar17,__newcontextvar18)),','('_$_$_ergo''rule_enabled'(6,'sets.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9)),FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar2,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar11))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),','('_$_$_ergo''rule_enabled'(8,'sets.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(neg^d^tblflapply)(nequal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(nequal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar7,__newcontextvar8)),','('_$_$_ergo''rule_enabled'(8,'sets.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__X,count,__C,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'sets.ergo',FLORA_THIS_MODULE_NAME),','(fllibcount(__newdontcarevar4,[],[],','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,members,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),FLORA_THIS_WORKSPACE(d^isa)(__X,'Set','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10))),fllibexecute_delayed_calls([__X,__newdontcarevar4],[])),__newvar5),=(__C,__newvar5)))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__set,isNull,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'sets.ergo',FLORA_THIS_MODULE_NAME),','(','(','(FLORA_THIS_WORKSPACE(d^mvd)(__set,count,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),FLORA_THIS_WORKSPACE(d^isa)(__set,'Set','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12))),==(__X,0)),fllibexecute_delayed_calls([__X,__set],[__set])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar2,___newomnivar1,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),null,FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),'_$_$_ergo''rule_enabled'(4,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(4,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar7,__newcontextvar8)),null,FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar2,___newomnivar1,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),'_$_$_ergo''rule_enabled'(4,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar13,__newcontextvar14)),null,','(FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar2,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3))),'_$_$_ergo''rule_enabled'(6,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar2,___newomnivar3,'_$ctxt'(_CallerModuleVar,__newcontextvar15,__newcontextvar16)),null,','(FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,__newcontextvar5)),FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,__newcontextvar7))),'_$_$_ergo''rule_enabled'(6,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar1,___newomnivar3,'_$ctxt'(_CallerModuleVar,__newcontextvar17,__newcontextvar18)),null,','(FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,__newcontextvar9)),FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar2,___newomnivar3,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,__newcontextvar11))),'_$_$_ergo''rule_enabled'(6,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar5,__newcontextvar6)),null,FLORA_THIS_WORKSPACE(neg^d^tblflapply)(nequal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,__newcontextvar1)),'_$_$_ergo''rule_enabled'(8,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(d^tblflapply)(nequal,___newomnivar1,___newomnivar2,'_$ctxt'(_CallerModuleVar,__newcontextvar7,__newcontextvar8)),null,FLORA_THIS_WORKSPACE(neg^d^tblflapply)(equal,___newomnivar1,___newomnivar2,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,__newcontextvar3)),'_$_$_ergo''rule_enabled'(8,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^mvd)(__X,count,__C,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(fllibcount(__newdontcarevar4,[],[],','(','(FLORA_THIS_WORKSPACE(d^mvd)(__X,members,__newdontcarevar4,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),FLORA_THIS_WORKSPACE(d^isa)(__X,'Set','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10))),fllibexecute_delayed_calls([__X,__newdontcarevar4],[])),__newvar5),=(__C,__newvar5)),null,'_$_$_ergo''rule_enabled'(10,'sets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'sets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(d^meth)(__set,isNull,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__set,count,__X,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),FLORA_THIS_WORKSPACE(d^isa)(__set,'Set','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12))),==(__X,0)),null,'_$_$_ergo''rule_enabled'(12,'sets.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__set],[__set]),true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'sets.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('sets.ergo',FLORA_THIS_MODULE_NAME))).

/************************************************************************
  file: headerinc/flrtrailer_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailer.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpreddef_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrpreddef.flh"

/***********************************************************************/

