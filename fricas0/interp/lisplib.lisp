 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; readLib(fn, ft) ==
;   -- see if it exists first
;   p := pathname [fn, ft]
;   rMkIstream(p)
 
(DEFUN |readLib| (|fn| |ft|)
  (PROG (|p|)
    (RETURN
     (PROGN (SETQ |p| (|pathname| (LIST |fn| |ft|))) (|rMkIstream| |p|)))))
 
; writeLib(fn, ft) == rMkOstream([fn, ft])
 
(DEFUN |writeLib| (|fn| |ft|)
  (PROG () (RETURN (|rMkOstream| (LIST |fn| |ft|)))))
 
; lisplibWrite(prop,val,filename) ==
;   -- this may someday not write NIL keys, but it will now
;   if $LISPLIB then
;      rwrite(prop,val,filename)
 
(DEFUN |lisplibWrite| (|prop| |val| |filename|)
  (PROG () (RETURN (COND ($LISPLIB (|rwrite| |prop| |val| |filename|))))))
 
; evalAndRwriteLispForm(key,form) ==
;   eval form
;   rwriteLispForm(key,form)
 
(DEFUN |evalAndRwriteLispForm| (|key| |form|)
  (PROG () (RETURN (PROGN (|eval| |form|) (|rwriteLispForm| |key| |form|)))))
 
; rwriteLispForm(key,form) ==
;   if $LISPLIB then
;     rwrite( key,form,$libFile)
;     output_lisp_form(form)
 
(DEFUN |rwriteLispForm| (|key| |form|)
  (PROG ()
    (RETURN
     (COND
      ($LISPLIB (|rwrite| |key| |form| |$libFile|)
       (|output_lisp_form| |form|))))))
 
; unInstantiate(clist) ==
;   for c in clist repeat
;     clearConstructorCache(c)
;   killNestedInstantiations(clist)
 
(DEFUN |unInstantiate| (|clist|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#1| |c|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |c| (CAR |bfVar#1|)) NIL))
            (RETURN NIL))
           ('T (|clearConstructorCache| |c|)))
          (SETQ |bfVar#1| (CDR |bfVar#1|))))
       |clist| NIL)
      (|killNestedInstantiations| |clist|)))))
 
; killNestedInstantiations(deps) ==
;   for key in HKEYS($ConstructorCache)
;     repeat
;       for [arg,count,:inst] in HGET($ConstructorCache,key) repeat
;         isNestedInstantiation(inst.0,deps) =>
;           HREMPROP($ConstructorCache,key,arg)
 
(DEFUN |killNestedInstantiations| (|deps|)
  (PROG (|arg| |ISTMP#1| |count| |inst|)
    (RETURN
     ((LAMBDA (|bfVar#2| |key|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#2|) (PROGN (SETQ |key| (CAR |bfVar#2|)) NIL))
           (RETURN NIL))
          (#1='T
           ((LAMBDA (|bfVar#4| |bfVar#3|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#4|)
                     (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |bfVar#3|)
                      (PROGN
                       (SETQ |arg| (CAR |bfVar#3|))
                       (SETQ |ISTMP#1| (CDR |bfVar#3|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |count| (CAR |ISTMP#1|))
                             (SETQ |inst| (CDR |ISTMP#1|))
                             #1#)))
                      (COND
                       ((|isNestedInstantiation| (ELT |inst| 0) |deps|)
                        (IDENTITY
                         (HREMPROP |$ConstructorCache| |key| |arg|)))))))
               (SETQ |bfVar#4| (CDR |bfVar#4|))))
            (HGET |$ConstructorCache| |key|) NIL)))
         (SETQ |bfVar#2| (CDR |bfVar#2|))))
      (HKEYS |$ConstructorCache|) NIL))))
 
; isNestedInstantiation(form,deps) ==
;   form is [op,:argl] =>
;     op in deps => true
;     or/[isNestedInstantiation(x,deps) for x in argl]
;   false
 
(DEFUN |isNestedInstantiation| (|form| |deps|)
  (PROG (|op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |form|)
            (PROGN (SETQ |op| (CAR |form|)) (SETQ |argl| (CDR |form|)) #1='T))
       (COND ((|member| |op| |deps|) T)
             (#1#
              ((LAMBDA (|bfVar#6| |bfVar#5| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#5|)
                        (PROGN (SETQ |x| (CAR |bfVar#5|)) NIL))
                    (RETURN |bfVar#6|))
                   (#1#
                    (PROGN
                     (SETQ |bfVar#6| (|isNestedInstantiation| |x| |deps|))
                     (COND (|bfVar#6| (RETURN |bfVar#6|))))))
                  (SETQ |bfVar#5| (CDR |bfVar#5|))))
               NIL |argl| NIL))))
      (#1# NIL)))))
 
; loadLibIfNotLoaded libName ==
;   -- replaces old SpadCondLoad
;   -- loads is library is not already loaded
;   GET(libName, 'LOADED) => NIL
;   loadLib libName
 
(DEFUN |loadLibIfNotLoaded| (|libName|)
  (PROG ()
    (RETURN (COND ((GET |libName| 'LOADED) NIL) ('T (|loadLib| |libName|))))))
 
; loadLib cname ==
;   startTimingProcess 'load
;   fullLibName := GETDATABASE(cname,'OBJECT) or return nil
;   systemdir? := isSystemDirectory(pathnameDirectory fullLibName)
;   update? := $forceDatabaseUpdate or not systemdir?
;   not update? =>
;      loadLibNoUpdate(cname, cname, fullLibName)
;   kind := GETDATABASE(cname,'CONSTRUCTORKIND)
;   if $printLoadMsgs then
;     sayKeyedMsg("S2IL0002",[namestring fullLibName,kind,cname])
;   load_quietly(fullLibName)
;   clearConstructorCache cname
;   updateDatabase(cname,cname,systemdir?)
;   installConstructor(cname,kind)
;   u := GETDATABASE(cname, 'CONSTRUCTORMODEMAP)
;   updateCategoryTable(cname,kind)
;   coSig :=
;       u =>
;           [[.,:sig],:.] := u
;           CONS(NIL, [categoryForm?(x) for x in rest sig])
;       NIL
;   -- in following, add property value false or NIL to possibly clear
;   -- old value
;   if null rest GETDATABASE(cname, 'CONSTRUCTORFORM) then
;       MAKEPROP(cname,'NILADIC,'T)
;     else
;       REMPROP(cname,'NILADIC)
;   MAKEPROP(cname,'LOADED,fullLibName)
;   if $InteractiveMode then $CategoryFrame := [[nil]]
;   stopTimingProcess 'load
;   'T
 
(DEFUN |loadLib| (|cname|)
  (PROG (|fullLibName| |systemdir?| |update?| |kind| |u| |sig| |coSig|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|load|)
      (SETQ |fullLibName| (OR (GETDATABASE |cname| 'OBJECT) (RETURN NIL)))
      (SETQ |systemdir?|
              (|isSystemDirectory| (|pathnameDirectory| |fullLibName|)))
      (SETQ |update?| (OR |$forceDatabaseUpdate| (NULL |systemdir?|)))
      (COND
       ((NULL |update?|) (|loadLibNoUpdate| |cname| |cname| |fullLibName|))
       (#1='T
        (PROGN
         (SETQ |kind| (GETDATABASE |cname| 'CONSTRUCTORKIND))
         (COND
          (|$printLoadMsgs|
           (|sayKeyedMsg| 'S2IL0002
            (LIST (|namestring| |fullLibName|) |kind| |cname|))))
         (|load_quietly| |fullLibName|)
         (|clearConstructorCache| |cname|)
         (|updateDatabase| |cname| |cname| |systemdir?|)
         (|installConstructor| |cname| |kind|)
         (SETQ |u| (GETDATABASE |cname| 'CONSTRUCTORMODEMAP))
         (|updateCategoryTable| |cname| |kind|)
         (SETQ |coSig|
                 (COND
                  (|u|
                   (PROGN
                    (SETQ |sig| (CDAR |u|))
                    (CONS NIL
                          ((LAMBDA (|bfVar#8| |bfVar#7| |x|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#7|)
                                    (PROGN (SETQ |x| (CAR |bfVar#7|)) NIL))
                                (RETURN (NREVERSE |bfVar#8|)))
                               (#1#
                                (SETQ |bfVar#8|
                                        (CONS (|categoryForm?| |x|)
                                              |bfVar#8|))))
                              (SETQ |bfVar#7| (CDR |bfVar#7|))))
                           NIL (CDR |sig|) NIL))))
                  (#1# NIL)))
         (COND
          ((NULL (CDR (GETDATABASE |cname| 'CONSTRUCTORFORM)))
           (MAKEPROP |cname| 'NILADIC 'T))
          (#1# (REMPROP |cname| 'NILADIC)))
         (MAKEPROP |cname| 'LOADED |fullLibName|)
         (COND (|$InteractiveMode| (SETQ |$CategoryFrame| (LIST (LIST NIL)))))
         (|stopTimingProcess| '|load|)
         'T)))))))
 
; loadLibNoUpdate(cname, libName, fullLibName) ==
;   kind := GETDATABASE(cname,'CONSTRUCTORKIND)
;   if $printLoadMsgs then
;     sayKeyedMsg("S2IL0002",[namestring fullLibName,kind,cname])
;   if CATCH('VERSIONCHECK, load_quietly(fullLibName)) = -1
;     then
;       PRINC('"   wrong library version...recompile ")
;       PRINC(fullLibName)
;       TERPRI()
;       TOPLEVEL()
;     else
;      clearConstructorCache cname
;      installConstructor(cname,kind)
;      MAKEPROP(cname,'LOADED,fullLibName)
;      if $InteractiveMode then $CategoryFrame := [[nil]]
;      stopTimingProcess 'load
;   'T
 
(DEFUN |loadLibNoUpdate| (|cname| |libName| |fullLibName|)
  (PROG (|kind|)
    (RETURN
     (PROGN
      (SETQ |kind| (GETDATABASE |cname| 'CONSTRUCTORKIND))
      (COND
       (|$printLoadMsgs|
        (|sayKeyedMsg| 'S2IL0002
         (LIST (|namestring| |fullLibName|) |kind| |cname|))))
      (COND
       ((EQUAL (CATCH 'VERSIONCHECK (|load_quietly| |fullLibName|)) (- 1))
        (PRINC "   wrong library version...recompile ") (PRINC |fullLibName|)
        (TERPRI) (TOPLEVEL))
       ('T (|clearConstructorCache| |cname|)
        (|installConstructor| |cname| |kind|)
        (MAKEPROP |cname| 'LOADED |fullLibName|)
        (COND (|$InteractiveMode| (SETQ |$CategoryFrame| (LIST (LIST NIL)))))
        (|stopTimingProcess| '|load|)))
      'T))))
 
; loadIfNecessary u == loadLibIfNecessary(u,true)
 
(DEFUN |loadIfNecessary| (|u|) (PROG () (RETURN (|loadLibIfNecessary| |u| T))))
 
; loadIfNecessaryAndExists u == loadLibIfNecessary(u,nil)
 
(DEFUN |loadIfNecessaryAndExists| (|u|)
  (PROG () (RETURN (|loadLibIfNecessary| |u| NIL))))
 
; loadLibIfNecessary(u,mustExist) ==
;   u = '$EmptyMode => u
;   null atom u => loadLibIfNecessary(first u,mustExist)
;   value:=
;     functionp(u) or macrop(u) => u
;     GET(u, 'LOADED) => u
;     loadLib u => u
;   null $InteractiveMode and ((null (y:= getProplist(u,$CategoryFrame)))
;     or (null LASSOC('isFunctor,y)) and (null LASSOC('isCategory,y))) =>
;       y:= GETDATABASE(u,'CONSTRUCTORKIND) =>
;          y = 'category =>
;             updateCategoryFrameForCategory u
;          updateCategoryFrameForConstructor u
;       throwKeyedMsg("S2IL0005",[u])
;   value
 
(DEFUN |loadLibIfNecessary| (|u| |mustExist|)
  (PROG (|value| |y|)
    (RETURN
     (COND ((EQ |u| '|$EmptyMode|) |u|)
           ((NULL (ATOM |u|)) (|loadLibIfNecessary| (CAR |u|) |mustExist|))
           (#1='T
            (PROGN
             (SETQ |value|
                     (COND ((OR (|functionp| |u|) (|macrop| |u|)) |u|)
                           ((GET |u| 'LOADED) |u|) ((|loadLib| |u|) |u|)))
             (COND
              ((AND (NULL |$InteractiveMode|)
                    (OR (NULL (SETQ |y| (|getProplist| |u| |$CategoryFrame|)))
                        (AND (NULL (LASSOC '|isFunctor| |y|))
                             (NULL (LASSOC '|isCategory| |y|)))))
               (COND
                ((SETQ |y| (GETDATABASE |u| 'CONSTRUCTORKIND))
                 (COND
                  ((EQ |y| '|category|) (|updateCategoryFrameForCategory| |u|))
                  (#1# (|updateCategoryFrameForConstructor| |u|))))
                (#1# (|throwKeyedMsg| 'S2IL0005 (LIST |u|)))))
              (#1# |value|))))))))
 
; convertOpAlist2compilerInfo(opalist) ==
;    "append"/[[formatSig(op,sig) for sig in siglist]
;                 for [op,:siglist] in opalist] where
;       formatSig(op, [typelist, slot,:stuff]) ==
;           pred := if stuff then first stuff else 'T
;           impl := if rest stuff then CADR stuff else 'ELT -- handles 'CONST
;           [[op, typelist], pred, [impl, '$, slot]]
 
(DEFUN |convertOpAlist2compilerInfo| (|opalist|)
  (PROG (|op| |siglist|)
    (RETURN
     ((LAMBDA (|bfVar#13| |bfVar#12| |bfVar#11|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#12|)
               (PROGN (SETQ |bfVar#11| (CAR |bfVar#12|)) NIL))
           (RETURN |bfVar#13|))
          (#1='T
           (AND (CONSP |bfVar#11|)
                (PROGN
                 (SETQ |op| (CAR |bfVar#11|))
                 (SETQ |siglist| (CDR |bfVar#11|))
                 #1#)
                (SETQ |bfVar#13|
                        (APPEND |bfVar#13|
                                ((LAMBDA (|bfVar#10| |bfVar#9| |sig|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#9|)
                                          (PROGN
                                           (SETQ |sig| (CAR |bfVar#9|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#10|)))
                                     (#1#
                                      (SETQ |bfVar#10|
                                              (CONS
                                               (|convertOpAlist2compilerInfo,formatSig|
                                                |op| |sig|)
                                               |bfVar#10|))))
                                    (SETQ |bfVar#9| (CDR |bfVar#9|))))
                                 NIL |siglist| NIL))))))
         (SETQ |bfVar#12| (CDR |bfVar#12|))))
      NIL |opalist| NIL))))
(DEFUN |convertOpAlist2compilerInfo,formatSig| (|op| |bfVar#14|)
  (PROG (|typelist| |slot| |stuff| |pred| |impl|)
    (RETURN
     (PROGN
      (SETQ |typelist| (CAR |bfVar#14|))
      (SETQ |slot| (CADR . #1=(|bfVar#14|)))
      (SETQ |stuff| (CDDR . #1#))
      (SETQ |pred| (COND (|stuff| (CAR |stuff|)) (#2='T 'T)))
      (SETQ |impl| (COND ((CDR |stuff|) (CADR |stuff|)) (#2# 'ELT)))
      (LIST (LIST |op| |typelist|) |pred| (LIST |impl| '$ |slot|))))))
 
; updateCategoryFrameForConstructor(constructor) ==
;    opAlist := GETDATABASE(constructor, 'OPERATIONALIST)
;    [[dc,:sig],[pred,impl]] := GETDATABASE(constructor, 'CONSTRUCTORMODEMAP)
;    $CategoryFrame := put(constructor,'isFunctor,
;        convertOpAlist2compilerInfo(opAlist),
;        addModemap(constructor, dc, sig, pred, impl,
;            put(constructor, 'mode, ['Mapping,:sig], $CategoryFrame)))
 
(DEFUN |updateCategoryFrameForConstructor| (|constructor|)
  (PROG (|opAlist| |LETTMP#1| |dc| |sig| |pred| |impl|)
    (RETURN
     (PROGN
      (SETQ |opAlist| (GETDATABASE |constructor| 'OPERATIONALIST))
      (SETQ |LETTMP#1| (GETDATABASE |constructor| 'CONSTRUCTORMODEMAP))
      (SETQ |dc| (CAAR . #1=(|LETTMP#1|)))
      (SETQ |sig| (CDAR . #1#))
      (SETQ |pred| (CAADR . #2=(|LETTMP#1|)))
      (SETQ |impl| (CADADR . #2#))
      (SETQ |$CategoryFrame|
              (|put| |constructor| '|isFunctor|
               (|convertOpAlist2compilerInfo| |opAlist|)
               (|addModemap| |constructor| |dc| |sig| |pred| |impl|
                (|put| |constructor| '|mode| (CONS '|Mapping| |sig|)
                 |$CategoryFrame|))))))))
 
; updateCategoryFrameForCategory(category) ==
;    di := GETDATABASE(category, 'CONSTRUCTORMODEMAP)
;    if di then
;        [[dc,:sig],[pred,impl]] := di
;        $CategoryFrame :=
;            addModemap(category, dc, sig, pred, impl, $CategoryFrame)
;    $CategoryFrame := put(category, 'isCategory, 'T, $CategoryFrame)
 
(DEFUN |updateCategoryFrameForCategory| (|category|)
  (PROG (|di| |dc| |sig| |pred| |impl|)
    (RETURN
     (PROGN
      (SETQ |di| (GETDATABASE |category| 'CONSTRUCTORMODEMAP))
      (COND
       (|di| (SETQ |dc| (CAAR . #1=(|di|))) (SETQ |sig| (CDAR . #1#))
        (SETQ |pred| (CAADR . #2=(|di|))) (SETQ |impl| (CADADR . #2#))
        (SETQ |$CategoryFrame|
                (|addModemap| |category| |dc| |sig| |pred| |impl|
                 |$CategoryFrame|))))
      (SETQ |$CategoryFrame|
              (|put| |category| '|isCategory| 'T |$CategoryFrame|))))))
 
; loadFunctor u ==
;   null atom u => loadFunctor first u
;   loadLibIfNotLoaded u
;   u
 
(DEFUN |loadFunctor| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL (ATOM |u|)) (|loadFunctor| (CAR |u|)))
           ('T (PROGN (|loadLibIfNotLoaded| |u|) |u|))))))
 
; makeConstructorsAutoLoad() ==
;   for cnam in allConstructors() repeat
;     REMPROP(cnam,'LOADED)
;     if GETDATABASE(cnam,'NILADIC)
;      then PUT(cnam,'NILADIC,'T)
;      else REMPROP(cnam,'NILADIC)
;     systemDependentMkAutoload(cnam,cnam)
 
(DEFUN |makeConstructorsAutoLoad| #1=()
  (PROG #1#
    (RETURN
     ((LAMBDA (|bfVar#15| |cnam|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#15|) (PROGN (SETQ |cnam| (CAR |bfVar#15|)) NIL))
           (RETURN NIL))
          (#2='T
           (PROGN
            (REMPROP |cnam| 'LOADED)
            (COND ((GETDATABASE |cnam| 'NILADIC) (PUT |cnam| 'NILADIC 'T))
                  (#2# (REMPROP |cnam| 'NILADIC)))
            (|systemDependentMkAutoload| |cnam| |cnam|))))
         (SETQ |bfVar#15| (CDR |bfVar#15|))))
      (|allConstructors|) NIL))))
 
; systemDependentMkAutoload(fn,cnam) ==
;     FBOUNDP(cnam) => "next"
;     asharpName := GETDATABASE(cnam, 'ASHARP?) =>
;          kind := GETDATABASE(cnam, 'CONSTRUCTORKIND)
;          cosig := GETDATABASE(cnam, 'COSIG)
;          file := GETDATABASE(cnam, 'OBJECT)
;          SET_-LIB_-FILE_-GETTER(file, cnam)
;          kind = 'category =>
;               ASHARPMKAUTOLOADCATEGORY(file, cnam, asharpName, cosig)
;          ASHARPMKAUTOLOADFUNCTOR(file, cnam, asharpName, cosig)
;     SETF(SYMBOL_-FUNCTION cnam,mkAutoLoad(fn, cnam))
 
(DEFUN |systemDependentMkAutoload| (|fn| |cnam|)
  (PROG (|asharpName| |kind| |cosig| |file|)
    (RETURN
     (COND ((FBOUNDP |cnam|) '|next|)
           ((SETQ |asharpName| (GETDATABASE |cnam| 'ASHARP?))
            (PROGN
             (SETQ |kind| (GETDATABASE |cnam| 'CONSTRUCTORKIND))
             (SETQ |cosig| (GETDATABASE |cnam| 'COSIG))
             (SETQ |file| (GETDATABASE |cnam| 'OBJECT))
             (SET-LIB-FILE-GETTER |file| |cnam|)
             (COND
              ((EQ |kind| '|category|)
               (ASHARPMKAUTOLOADCATEGORY |file| |cnam| |asharpName| |cosig|))
              (#1='T
               (ASHARPMKAUTOLOADFUNCTOR |file| |cnam| |asharpName| |cosig|)))))
           (#1# (SETF (SYMBOL-FUNCTION |cnam|) (|mkAutoLoad| |fn| |cnam|)))))))
 
; autoLoad(abb,cname) ==
;   if not GET(cname, 'LOADED) then
;       FMAKUNBOUND cname
;       loadLib cname
;   SYMBOL_-FUNCTION cname
 
(DEFUN |autoLoad| (|abb| |cname|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       ((NULL (GET |cname| 'LOADED)) (FMAKUNBOUND |cname|)
        (|loadLib| |cname|)))
      (SYMBOL-FUNCTION |cname|)))))
 
; setAutoLoadProperty(name) ==
;   REMPROP(name,'LOADED)
;   SETF(SYMBOL_-FUNCTION name,mkAutoLoad(name, name))
 
(DEFUN |setAutoLoadProperty| (|name|)
  (PROG ()
    (RETURN
     (PROGN
      (REMPROP |name| 'LOADED)
      (SETF (SYMBOL-FUNCTION |name|) (|mkAutoLoad| |name| |name|))))))
 
; unloadOneConstructor(cnam,fn) ==
;     REMPROP(cnam,'LOADED)
;     SETF(SYMBOL_-FUNCTION cnam,mkAutoLoad(fn, cnam))
 
(DEFUN |unloadOneConstructor| (|cnam| |fn|)
  (PROG ()
    (RETURN
     (PROGN
      (REMPROP |cnam| 'LOADED)
      (SETF (SYMBOL-FUNCTION |cnam|) (|mkAutoLoad| |fn| |cnam|))))))
 
; compDefineLisplib(df:=["DEF",[op,:.],:.],m,e,prefix,fal,fn) ==
;   --fn= compDefineCategory OR compDefineFunctor
;   sayMSG fillerSpaces(72,'"-")
;   $LISPLIB: local := 'T
;   $op: local := op
;   $lisplibPredicates: local := NIL -- set by makePredicateBitVector
;   $lisplibForm: local := NIL
;   $lisplibKind: local := NIL
;   $lisplibAbbreviation: local := NIL
;   $lisplibParents: local := NIL
;   $lisplibAncestors: local := NIL
;   $lisplibModemap: local := NIL
;   $lisplibModemapAlist: local := NIL
;   $lisplibOperationAlist: local := NIL
;   $lisplibSuperDomain: local := NIL
;   $libFile: local := NIL
;   $lisplibCategory: local := nil
;   $compiler_output_stream : local := nil
;   --for categories, is rhs of definition; otherwise, is target of functor
;   --will eventually become the "constructorCategory" property in lisplib
;   --set in compDefineCategory1 if category, otherwise in finalizeLisplib
;   libName := getConstructorAbbreviation op
;   sayMSG ['"   initializing ",$spadLibFT,:bright libName,
;     '"for",:bright op]
;   -- following guarantee's compiler output files get closed.
;   UNWIND_-PROTECT(
;       PROGN(initializeLisplib libName,
;             sayMSG ['"   compiling into ", $spadLibFT, :bright libName],
;             res := FUNCALL(fn, df, m, e, prefix, fal),
;             sayMSG ['"   finalizing ",$spadLibFT,:bright libName],
;             finalizeLisplib libName),
;       PROGN(if $compiler_output_stream then CLOSE($compiler_output_stream),
;             RSHUT $libFile))
;   lisplibDoRename(libName)
;   filearg := make_full_namestring([libName, $spadLibFT])
;   RPACKFILE filearg
;   FRESH_-LINE $algebraOutputStream
;   sayMSG fillerSpaces(72,'"-")
;   unloadOneConstructor(op,libName)
;   LOCALDATABASE(LIST GETDATABASE(op,'ABBREVIATION),NIL)
;   $newConlist := [op, :$newConlist]  ---------->  bound in function "compiler"
;   if $lisplibKind = 'category
;     then updateCategoryFrameForCategory op
;      else updateCategoryFrameForConstructor op
;   res
 
(DEFUN |compDefineLisplib| (|df| |m| |e| |prefix| |fal| |fn|)
  (PROG (|$compiler_output_stream| |$lisplibCategory| |$libFile|
         |$lisplibSuperDomain| |$lisplibOperationAlist| |$lisplibModemapAlist|
         |$lisplibModemap| |$lisplibAncestors| |$lisplibParents|
         |$lisplibAbbreviation| |$lisplibKind| |$lisplibForm|
         |$lisplibPredicates| |$op| $LISPLIB |filearg| |res| |libName| |op|)
    (DECLARE
     (SPECIAL |$compiler_output_stream| |$lisplibCategory| |$libFile|
      |$lisplibSuperDomain| |$lisplibOperationAlist| |$lisplibModemapAlist|
      |$lisplibModemap| |$lisplibAncestors| |$lisplibParents|
      |$lisplibAbbreviation| |$lisplibKind| |$lisplibForm| |$lisplibPredicates|
      |$op| $LISPLIB))
    (RETURN
     (PROGN
      (SETQ |op| (CAADR |df|))
      (|sayMSG| (|fillerSpaces| 72 "-"))
      (SETQ $LISPLIB 'T)
      (SETQ |$op| |op|)
      (SETQ |$lisplibPredicates| NIL)
      (SETQ |$lisplibForm| NIL)
      (SETQ |$lisplibKind| NIL)
      (SETQ |$lisplibAbbreviation| NIL)
      (SETQ |$lisplibParents| NIL)
      (SETQ |$lisplibAncestors| NIL)
      (SETQ |$lisplibModemap| NIL)
      (SETQ |$lisplibModemapAlist| NIL)
      (SETQ |$lisplibOperationAlist| NIL)
      (SETQ |$lisplibSuperDomain| NIL)
      (SETQ |$libFile| NIL)
      (SETQ |$lisplibCategory| NIL)
      (SETQ |$compiler_output_stream| NIL)
      (SETQ |libName| (|getConstructorAbbreviation| |op|))
      (|sayMSG|
       (CONS "   initializing "
             (CONS |$spadLibFT|
                   (APPEND (|bright| |libName|)
                           (CONS "for" (|bright| |op|))))))
      (UNWIND-PROTECT
          (PROGN
           (|initializeLisplib| |libName|)
           (|sayMSG|
            (CONS "   compiling into "
                  (CONS |$spadLibFT| (|bright| |libName|))))
           (SETQ |res| (FUNCALL |fn| |df| |m| |e| |prefix| |fal|))
           (|sayMSG|
            (CONS "   finalizing " (CONS |$spadLibFT| (|bright| |libName|))))
           (|finalizeLisplib| |libName|))
        (PROGN
         (COND (|$compiler_output_stream| (CLOSE |$compiler_output_stream|)))
         (RSHUT |$libFile|)))
      (|lisplibDoRename| |libName|)
      (SETQ |filearg| (|make_full_namestring| (LIST |libName| |$spadLibFT|)))
      (RPACKFILE |filearg|)
      (FRESH-LINE |$algebraOutputStream|)
      (|sayMSG| (|fillerSpaces| 72 "-"))
      (|unloadOneConstructor| |op| |libName|)
      (LOCALDATABASE (LIST (GETDATABASE |op| 'ABBREVIATION)) NIL)
      (SETQ |$newConlist| (CONS |op| |$newConlist|))
      (COND
       ((EQ |$lisplibKind| '|category|)
        (|updateCategoryFrameForCategory| |op|))
       ('T (|updateCategoryFrameForConstructor| |op|)))
      |res|))))
 
; initializeLisplib libName ==
;   erase_lib([libName, 'ERRORLIB])
;   $libFile:= writeLib(libName,'ERRORLIB)
;   $compiler_output_stream := make_compiler_output_stream($libFile, libName)
 
(DEFUN |initializeLisplib| (|libName|)
  (PROG ()
    (RETURN
     (PROGN
      (|erase_lib| (LIST |libName| 'ERRORLIB))
      (SETQ |$libFile| (|writeLib| |libName| 'ERRORLIB))
      (SETQ |$compiler_output_stream|
              (|make_compiler_output_stream| |$libFile| |libName|))))))
 
; finalizeLisplib libName ==
;   lisplibWrite('"constructorForm",removeZeroOne $lisplibForm,$libFile)
;   lisplibWrite('"constructorKind",kind:=removeZeroOne $lisplibKind,$libFile)
;   lisplibWrite('"constructorModemap",removeZeroOne $lisplibModemap,$libFile)
;   $lisplibCategory:= $lisplibCategory or $lisplibModemap.mmTarget
;   -- set to target of modemap for package/domain constructors;
;   -- to the right-hand sides (the definition) for category constructors
;   lisplibWrite('"constructorCategory",$lisplibCategory,$libFile)
;   lisplibWrite('"sourceFile", namestring($edit_file), $libFile)
;   lisplibWrite('"modemaps",removeZeroOne $lisplibModemapAlist,$libFile)
;   opsAndAtts:= getConstructorOpsAndAtts($lisplibForm, kind)
;   lisplibWrite('"operationAlist", removeZeroOne first opsAndAtts, $libFile)
;   lisplibWrite('"superDomain",removeZeroOne $lisplibSuperDomain,$libFile)
;   lisplibWrite('"predicates",removeZeroOne  $lisplibPredicates,$libFile)
;   lisplibWrite('"abbreviation",$lisplibAbbreviation,$libFile)
;   lisplibWrite('"parents",removeZeroOne $lisplibParents,$libFile)
;   lisplibWrite('"ancestors",removeZeroOne $lisplibAncestors,$libFile)
;   lisplibWrite('"documentation",finalizeDocumentation(),$libFile)
;   if $profileCompiler then profileWrite()
;   if $lisplibForm and null rest $lisplibForm then
;     MAKEPROP(first $lisplibForm, 'NILADIC, 'T)
 
(DEFUN |finalizeLisplib| (|libName|)
  (PROG (|kind| |opsAndAtts|)
    (RETURN
     (PROGN
      (|lisplibWrite| "constructorForm" (|removeZeroOne| |$lisplibForm|)
       |$libFile|)
      (|lisplibWrite| "constructorKind"
       (SETQ |kind| (|removeZeroOne| |$lisplibKind|)) |$libFile|)
      (|lisplibWrite| "constructorModemap" (|removeZeroOne| |$lisplibModemap|)
       |$libFile|)
      (SETQ |$lisplibCategory|
              (OR |$lisplibCategory| (CADAR |$lisplibModemap|)))
      (|lisplibWrite| "constructorCategory" |$lisplibCategory| |$libFile|)
      (|lisplibWrite| "sourceFile" (|namestring| |$edit_file|) |$libFile|)
      (|lisplibWrite| "modemaps" (|removeZeroOne| |$lisplibModemapAlist|)
       |$libFile|)
      (SETQ |opsAndAtts| (|getConstructorOpsAndAtts| |$lisplibForm| |kind|))
      (|lisplibWrite| "operationAlist" (|removeZeroOne| (CAR |opsAndAtts|))
       |$libFile|)
      (|lisplibWrite| "superDomain" (|removeZeroOne| |$lisplibSuperDomain|)
       |$libFile|)
      (|lisplibWrite| "predicates" (|removeZeroOne| |$lisplibPredicates|)
       |$libFile|)
      (|lisplibWrite| "abbreviation" |$lisplibAbbreviation| |$libFile|)
      (|lisplibWrite| "parents" (|removeZeroOne| |$lisplibParents|) |$libFile|)
      (|lisplibWrite| "ancestors" (|removeZeroOne| |$lisplibAncestors|)
       |$libFile|)
      (|lisplibWrite| "documentation" (|finalizeDocumentation|) |$libFile|)
      (COND (|$profileCompiler| (|profileWrite|)))
      (COND
       ((AND |$lisplibForm| (NULL (CDR |$lisplibForm|)))
        (MAKEPROP (CAR |$lisplibForm|) 'NILADIC 'T)))))))
 
; lisplibDoRename(libName) ==
;     replace_lib([libName, 'ERRORLIB], [libName, $spadLibFT])
 
(DEFUN |lisplibDoRename| (|libName|)
  (PROG ()
    (RETURN
     (|replace_lib| (LIST |libName| 'ERRORLIB) (LIST |libName| |$spadLibFT|)))))
 
; lisplibError(cname,fname,type,cn,fn,typ,error) ==
;   $bootStrapMode and error = "wrongType" => nil
;   sayMSG bright ['"  Illegal ",$spadLibFT]
;   error in '(duplicateAbb  wrongType) =>
;     sayKeyedMsg("S2IL0007",
;       [namestring [fname,$spadLibFT],type,cname,typ,cn])
;   error is 'abbIsName =>
;     throwKeyedMsg("S2IL0008",[fname,typ,namestring [fn,$spadLibFT]])
 
(DEFUN |lisplibError| (|cname| |fname| |type| |cn| |fn| |typ| |error|)
  (PROG ()
    (RETURN
     (COND ((AND |$bootStrapMode| (EQ |error| '|wrongType|)) NIL)
           ('T
            (PROGN
             (|sayMSG| (|bright| (LIST "  Illegal " |$spadLibFT|)))
             (COND
              ((|member| |error| '(|duplicateAbb| |wrongType|))
               (|sayKeyedMsg| 'S2IL0007
                (LIST (|namestring| (LIST |fname| |$spadLibFT|)) |type| |cname|
                      |typ| |cn|)))
              ((EQ |error| '|abbIsName|)
               (|throwKeyedMsg| 'S2IL0008
                (LIST |fname| |typ|
                      (|namestring| (LIST |fn| |$spadLibFT|))))))))))))
 
; getPartialConstructorModemapSig(c) ==
;   (s := getConstructorSignature c) => rest s
;   throwEvalTypeMsg("S2IL0015",[c])
 
(DEFUN |getPartialConstructorModemapSig| (|c|)
  (PROG (|s|)
    (RETURN
     (COND ((SETQ |s| (|getConstructorSignature| |c|)) (CDR |s|))
           ('T (|throwEvalTypeMsg| 'S2IL0015 (LIST |c|)))))))
 
; getConstructorOpsAndAtts(form, kind) ==
;   kind is 'category => getCategoryOpsAndAtts(form)
;   getFunctorOpsAndAtts(form)
 
(DEFUN |getConstructorOpsAndAtts| (|form| |kind|)
  (PROG ()
    (RETURN
     (COND ((EQ |kind| '|category|) (|getCategoryOpsAndAtts| |form|))
           ('T (|getFunctorOpsAndAtts| |form|))))))
 
; getCategoryOpsAndAtts(catForm) ==
;   -- returns [operations, :attributes] of first catForm
;   [transformOperationAlist getSlot1FromCategoryForm(catForm)]
 
(DEFUN |getCategoryOpsAndAtts| (|catForm|)
  (PROG ()
    (RETURN
     (LIST
      (|transformOperationAlist| (|getSlot1FromCategoryForm| |catForm|))))))
 
; getFunctorOpsAndAtts(form) ==
;   [transformOperationAlist $lisplibOperationAlist]
 
(DEFUN |getFunctorOpsAndAtts| (|form|)
  (PROG ()
    (RETURN (LIST (|transformOperationAlist| |$lisplibOperationAlist|)))))
 
; transformOperationAlist operationAlist ==
;   --  this transforms the operationAlist which is written out onto LISPLIBs.
;   --  The original form of this list is a list of items of the form:
;   --        ((<op> <signature>) (<condition> (ELT $ n)))
;   --  The new form is an op-Alist which has entries (<op> . signature-Alist)
;   --      where signature-Alist has entries (<signature> . item)
;   --        where item has form (<slotNumber> <condition> <kind>)
;   --          where <kind> =
;   --             NIL  => function
;   --             CONST => constant ... and others
;   newAlist:= nil
;   for [[op,sig,:.],condition,implementation] in operationAlist repeat
;     kind:=
;       implementation is [eltEtc,.,n] and eltEtc in '(CONST ELT) => eltEtc
;       implementation is [impOp,:.] =>
;         impOp = 'XLAM => implementation
;         impOp in '(CONST Subsumed) => impOp
;         keyedSystemError("S2IL0025",[impOp])
;       implementation = 'mkRecord => 'mkRecord
;       keyedSystemError("S2IL0025",[implementation])
;     signatureItem:=
;       if u:= assoc([op,sig],$functionLocations) then n := [n,:rest u]
;       kind = 'ELT =>
;         condition = 'T => [sig,n]
;         [sig,n,condition]
;       [sig,n,condition,kind]
;     itemList := [signatureItem, :QLASSQ(op, newAlist)]
;     newAlist:= insertAlist(op,itemList,newAlist)
;   newAlist
 
(DEFUN |transformOperationAlist| (|operationAlist|)
  (PROG (|newAlist| |ISTMP#1| |op| |ISTMP#2| |sig| |ISTMP#3| |condition|
         |ISTMP#4| |implementation| |eltEtc| |n| |impOp| |kind| |u|
         |signatureItem| |itemList|)
    (RETURN
     (PROGN
      (SETQ |newAlist| NIL)
      ((LAMBDA (|bfVar#17| |bfVar#16|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#17|)
                (PROGN (SETQ |bfVar#16| (CAR |bfVar#17|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#16|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |bfVar#16|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |op| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN (SETQ |sig| (CAR |ISTMP#2|)) #1#)))))
                 (PROGN
                  (SETQ |ISTMP#3| (CDR |bfVar#16|))
                  (AND (CONSP |ISTMP#3|)
                       (PROGN
                        (SETQ |condition| (CAR |ISTMP#3|))
                        (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                        (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                             (PROGN
                              (SETQ |implementation| (CAR |ISTMP#4|))
                              #1#)))))
                 (PROGN
                  (SETQ |kind|
                          (COND
                           ((AND (CONSP |implementation|)
                                 (PROGN
                                  (SETQ |eltEtc| (CAR |implementation|))
                                  (SETQ |ISTMP#1| (CDR |implementation|))
                                  (AND (CONSP |ISTMP#1|)
                                       (PROGN
                                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                        (AND (CONSP |ISTMP#2|)
                                             (EQ (CDR |ISTMP#2|) NIL)
                                             (PROGN
                                              (SETQ |n| (CAR |ISTMP#2|))
                                              #1#)))))
                                 (|member| |eltEtc| '(CONST ELT)))
                            |eltEtc|)
                           ((AND (CONSP |implementation|)
                                 (PROGN
                                  (SETQ |impOp| (CAR |implementation|))
                                  #1#))
                            (COND ((EQ |impOp| 'XLAM) |implementation|)
                                  ((|member| |impOp| '(CONST |Subsumed|))
                                   |impOp|)
                                  (#1#
                                   (|keyedSystemError| 'S2IL0025
                                    (LIST |impOp|)))))
                           ((EQ |implementation| '|mkRecord|) '|mkRecord|)
                           (#1#
                            (|keyedSystemError| 'S2IL0025
                             (LIST |implementation|)))))
                  (SETQ |signatureItem|
                          (PROGN
                           (COND
                            ((SETQ |u|
                                     (|assoc| (LIST |op| |sig|)
                                      |$functionLocations|))
                             (SETQ |n| (CONS |n| (CDR |u|)))))
                           (COND
                            ((EQ |kind| 'ELT)
                             (COND ((EQ |condition| 'T) (LIST |sig| |n|))
                                   (#1# (LIST |sig| |n| |condition|))))
                            (#1# (LIST |sig| |n| |condition| |kind|)))))
                  (SETQ |itemList|
                          (CONS |signatureItem| (QLASSQ |op| |newAlist|)))
                  (SETQ |newAlist|
                          (|insertAlist| |op| |itemList| |newAlist|))))))
          (SETQ |bfVar#17| (CDR |bfVar#17|))))
       |operationAlist| NIL)
      |newAlist|))))
 
; getConstructorModemap form ==
;   GETDATABASE(opOf form, 'CONSTRUCTORMODEMAP)
 
(DEFUN |getConstructorModemap| (|form|)
  (PROG () (RETURN (GETDATABASE (|opOf| |form|) 'CONSTRUCTORMODEMAP))))
 
; getConstructorSignature form ==
;   (mm := GETDATABASE(opOf(form),'CONSTRUCTORMODEMAP)) =>
;     [[.,:sig],:.] := mm
;     sig
;   NIL
 
(DEFUN |getConstructorSignature| (|form|)
  (PROG (|mm| |sig|)
    (RETURN
     (COND
      ((SETQ |mm| (GETDATABASE (|opOf| |form|) 'CONSTRUCTORMODEMAP))
       (PROGN (SETQ |sig| (CDAR |mm|)) |sig|))
      ('T NIL)))))
 
; augModemapsFromDomain1(name,functorForm,e) ==
;   GET(IFCAR functorForm, "makeFunctionList") =>
;     addConstructorModemaps(name,functorForm,e)
;   atom functorForm and (catform:= getmode(functorForm,e)) =>
;     augModemapsFromCategory(name,name,functorForm,catform,e)
;   mappingForm := getmodeOrMapping(IFCAR functorForm, e) =>
;     ["Mapping",categoryForm,:functArgTypes]:= mappingForm
;     catform:= substituteCategoryArguments(rest functorForm,categoryForm)
;     augModemapsFromCategory(name,name,functorForm,catform,e)
;   stackMessage [functorForm," is an unknown mode"]
;   e
 
(DEFUN |augModemapsFromDomain1| (|name| |functorForm| |e|)
  (PROG (|catform| |mappingForm| |categoryForm| |functArgTypes|)
    (RETURN
     (COND
      ((GET (IFCAR |functorForm|) '|makeFunctionList|)
       (|addConstructorModemaps| |name| |functorForm| |e|))
      ((AND (ATOM |functorForm|)
            (SETQ |catform| (|getmode| |functorForm| |e|)))
       (|augModemapsFromCategory| |name| |name| |functorForm| |catform| |e|))
      ((SETQ |mappingForm| (|getmodeOrMapping| (IFCAR |functorForm|) |e|))
       (PROGN
        (SETQ |categoryForm| (CADR . #1=(|mappingForm|)))
        (SETQ |functArgTypes| (CDDR . #1#))
        (SETQ |catform|
                (|substituteCategoryArguments| (CDR |functorForm|)
                 |categoryForm|))
        (|augModemapsFromCategory| |name| |name| |functorForm| |catform| |e|)))
      ('T
       (PROGN
        (|stackMessage| (LIST |functorForm| '| is an unknown mode|))
        |e|))))))
 
; getSlot1FromCategoryForm ([op, :argl]) ==
;   u:= eval [op,:MAPCAR('MKQ,TAKE(#argl,$FormalMapVariableList))]
;   null VECP u =>
;     systemErrorHere '"getSlot1FromCategoryForm"
;   u.1
 
(DEFUN |getSlot1FromCategoryForm| (|bfVar#18|)
  (PROG (|op| |argl| |u|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#18|))
      (SETQ |argl| (CDR |bfVar#18|))
      (SETQ |u|
              (|eval|
               (CONS |op|
                     (MAPCAR 'MKQ
                             (TAKE (LENGTH |argl|)
                              |$FormalMapVariableList|)))))
      (COND ((NULL (VECP |u|)) (|systemErrorHere| "getSlot1FromCategoryForm"))
            ('T (ELT |u| 1)))))))
 
; mkEvalableCategoryForm c ==       --from DEFINE
;   c is [op,:argl] =>
;     op="Join" =>
;         nargs := [mkEvalableCategoryForm x or return nil for x in argl]
;         nargs => ["Join", :nargs]
;     op is "DomainSubstitutionMacro" =>
;         --$extraParms :local
;         --catobj := EVAL c -- DomainSubstitutionFunction makes $extraParms
;         --mkEvalableCategoryForm sublisV($extraParms, catobj)
;         mkEvalableCategoryForm CADR argl
;     op is "mkCategory" => c
;     MEMQ(op,$CategoryNames) =>
;         [x,m,$e]:= compOrCroak(c,$EmptyMode,$e)
;         m=$Category => optFunctorBody x
;     --loadIfNecessary op
;     GETDATABASE(op,'CONSTRUCTORKIND) = 'category or
;       get(op,"isCategory",$CategoryFrame) =>
;         [op,:[quotifyCategoryArgument x for x in argl]]
;     [x,m,$e]:= compOrCroak(c,$EmptyMode,$e)
;     m=$Category => x
;   MKQ c
 
(DEFUN |mkEvalableCategoryForm| (|c|)
  (PROG (|op| |argl| |nargs| |LETTMP#1| |x| |m|)
    (RETURN
     (COND
      ((AND (CONSP |c|)
            (PROGN (SETQ |op| (CAR |c|)) (SETQ |argl| (CDR |c|)) #1='T))
       (COND
        ((EQ |op| '|Join|)
         (PROGN
          (SETQ |nargs|
                  ((LAMBDA (|bfVar#20| |bfVar#19| |x|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#19|)
                            (PROGN (SETQ |x| (CAR |bfVar#19|)) NIL))
                        (RETURN (NREVERSE |bfVar#20|)))
                       (#1#
                        (SETQ |bfVar#20|
                                (CONS
                                 (OR (|mkEvalableCategoryForm| |x|)
                                     (RETURN NIL))
                                 |bfVar#20|))))
                      (SETQ |bfVar#19| (CDR |bfVar#19|))))
                   NIL |argl| NIL))
          (COND (|nargs| (CONS '|Join| |nargs|)))))
        ((EQ |op| '|DomainSubstitutionMacro|)
         (|mkEvalableCategoryForm| (CADR |argl|)))
        ((EQ |op| '|mkCategory|) |c|)
        ((MEMQ |op| |$CategoryNames|)
         (PROGN
          (SETQ |LETTMP#1| (|compOrCroak| |c| |$EmptyMode| |$e|))
          (SETQ |x| (CAR |LETTMP#1|))
          (SETQ |m| (CADR . #2=(|LETTMP#1|)))
          (SETQ |$e| (CADDR . #2#))
          (COND ((EQUAL |m| |$Category|) (|optFunctorBody| |x|)))))
        ((OR (EQ (GETDATABASE |op| 'CONSTRUCTORKIND) '|category|)
             (|get| |op| '|isCategory| |$CategoryFrame|))
         (CONS |op|
               ((LAMBDA (|bfVar#22| |bfVar#21| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#21|)
                         (PROGN (SETQ |x| (CAR |bfVar#21|)) NIL))
                     (RETURN (NREVERSE |bfVar#22|)))
                    (#1#
                     (SETQ |bfVar#22|
                             (CONS (|quotifyCategoryArgument| |x|)
                                   |bfVar#22|))))
                   (SETQ |bfVar#21| (CDR |bfVar#21|))))
                NIL |argl| NIL)))
        (#1#
         (PROGN
          (SETQ |LETTMP#1| (|compOrCroak| |c| |$EmptyMode| |$e|))
          (SETQ |x| (CAR |LETTMP#1|))
          (SETQ |m| (CADR . #3=(|LETTMP#1|)))
          (SETQ |$e| (CADDR . #3#))
          (COND ((EQUAL |m| |$Category|) |x|))))))
      (#1# (MKQ |c|))))))
 
; isDomainForm(D,e) ==
;   --added for MPOLY 3/83 by RDJ
;   MEMQ(IFCAR D, $SpecialDomainNames) or isFunctor D or
;     -- ((D is ['Mapping,target,:.]) and isCategoryForm(target,e)) or
;      ((getmode(D,e) is ['Mapping,target,:.]) and isCategoryForm(target,e)) or
;        isCategoryForm(getmode(D,e),e) or isDomainConstructorForm(D,e)
 
(DEFUN |isDomainForm| (D |e|)
  (PROG (|ISTMP#1| |ISTMP#2| |target|)
    (RETURN
     (OR (MEMQ (IFCAR D) |$SpecialDomainNames|) (|isFunctor| D)
         (AND
          (PROGN
           (SETQ |ISTMP#1| (|getmode| D |e|))
           (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
                (PROGN
                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|)
                      (PROGN (SETQ |target| (CAR |ISTMP#2|)) 'T)))))
          (|isCategoryForm| |target| |e|))
         (|isCategoryForm| (|getmode| D |e|) |e|)
         (|isDomainConstructorForm| D |e|)))))
 
; isDomainConstructorForm(D,e) ==
;   D is [op,:argl] and (u:= get(op,"value",e)) and
;     u is [.,["Mapping",target,:.],:.] and
;       isCategoryForm(EQSUBSTLIST(argl,$FormalMapVariableList,target),e)
 
(DEFUN |isDomainConstructorForm| (D |e|)
  (PROG (|op| |argl| |u| |ISTMP#1| |ISTMP#2| |ISTMP#3| |target|)
    (RETURN
     (AND (CONSP D) (PROGN (SETQ |op| (CAR D)) (SETQ |argl| (CDR D)) #1='T)
          (SETQ |u| (|get| |op| '|value| |e|)) (CONSP |u|)
          (PROGN
           (SETQ |ISTMP#1| (CDR |u|))
           (AND (CONSP |ISTMP#1|)
                (PROGN
                 (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Mapping|)
                      (PROGN
                       (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                       (AND (CONSP |ISTMP#3|)
                            (PROGN (SETQ |target| (CAR |ISTMP#3|)) #1#)))))))
          (|isCategoryForm|
           (EQSUBSTLIST |argl| |$FormalMapVariableList| |target|) |e|)))))
 
; isFunctor x ==
;   op:= opOf x
;   not IDENTP op => false
;   $InteractiveMode =>
;     MEMQ(op,'(Union SubDomain Mapping Record)) => true
;     MEMQ(GETDATABASE(op,'CONSTRUCTORKIND),'(domain package))
;   u:= get(op,'isFunctor,$CategoryFrame)
;     or MEMQ(op,'(SubDomain Union Record)) => u
;   constructor? op =>
;     prop := get(op,'isFunctor,$CategoryFrame) => prop
;     if GETDATABASE(op,'CONSTRUCTORKIND) = 'category
;       then updateCategoryFrameForCategory op
;       else updateCategoryFrameForConstructor op
;     get(op,'isFunctor,$CategoryFrame)
;   nil
 
(DEFUN |isFunctor| (|x|)
  (PROG (|op| |u| |prop|)
    (RETURN
     (PROGN
      (SETQ |op| (|opOf| |x|))
      (COND ((NULL (IDENTP |op|)) NIL)
            (|$InteractiveMode|
             (COND ((MEMQ |op| '(|Union| |SubDomain| |Mapping| |Record|)) T)
                   (#1='T
                    (MEMQ (GETDATABASE |op| 'CONSTRUCTORKIND)
                          '(|domain| |package|)))))
            ((SETQ |u|
                     (OR (|get| |op| '|isFunctor| |$CategoryFrame|)
                         (MEMQ |op| '(|SubDomain| |Union| |Record|))))
             |u|)
            ((|constructor?| |op|)
             (COND
              ((SETQ |prop| (|get| |op| '|isFunctor| |$CategoryFrame|)) |prop|)
              (#1#
               (PROGN
                (COND
                 ((EQ (GETDATABASE |op| 'CONSTRUCTORKIND) '|category|)
                  (|updateCategoryFrameForCategory| |op|))
                 (#1# (|updateCategoryFrameForConstructor| |op|)))
                (|get| |op| '|isFunctor| |$CategoryFrame|)))))
            (#1# NIL))))))
