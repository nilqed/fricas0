
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $all_constructors := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$all_constructors| NIL))

; $operation_hash := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$operation_hash| NIL))

; $has_category_hash := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$has_category_hash| NIL))

; allConstructors() == $all_constructors

(DEFUN |allConstructors| () (PROG () (RETURN |$all_constructors|)))

; do_operation1(key, val) ==
;     PUSH(key, $all_operations)

(DEFUN |do_operation1| (|key| |val|)
  (PROG () (RETURN (PUSH |key| |$all_operations|))))

; allOperations() ==
;     $all_operations => $all_operations
;     MAPHASH(function do_operation1, $operation_hash)
;     $all_operations

(DEFUN |allOperations| ()
  (PROG ()
    (RETURN
     (COND (|$all_operations| |$all_operations|)
           ('T
            (PROGN
             (MAPHASH #'|do_operation1| |$operation_hash|)
             |$all_operations|))))))

; spad_set_autoload(c_name) ==
;     SETF(SYMBOL_-FUNCTION(c_name), mkAutoLoad(c_name))

(DEFUN |spad_set_autoload| (|c_name|)
  (PROG () (RETURN (SETF (SYMBOL-FUNCTION |c_name|) (|mkAutoLoad| |c_name|)))))

; $defaultdomain_list := '(
;   (AlgebraicallyClosedFunctionSpace Expression)
;   (AssociationListAggregate AssociationList)
;   (BiCPO FiniteBiCPO)                  (ComplexCategory Complex)
;   (DequeueAggregate Dequeue)           (DistributionCategory Distribution)
;   (FileNameCategory FileName)          (FreeLieAlgebra LiePolynomial)
;   (FunctionSpace Expression)           (IntervalCategory Interval)
;   (JetBundleBaseFunctionCategory JetBundleXExpression)
;   (LazyStreamAggregate Stream)         (MonoidRingCategory MonoidRing)
;   (MultisetAggregate Multiset)         (OctonionCategory Octonion)
;   (PermutationCategory Permutation)    (PlottableSpaceCurveCategory Plot3D)
;   (PointCategory Point)                (PriorityQueueAggregate Heap)
;   (QuaternionCategory Quaternion)
;   (RealRootCharacterizationCategory RightOpenIntervalRootCharacterization)
;   (SequenceCategory Sequence)
;   (StringCategory String)              (ThreeSpaceCategory ThreeSpace)
;   )

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$defaultdomain_list|
          '((|AlgebraicallyClosedFunctionSpace| |Expression|)
            (|AssociationListAggregate| |AssociationList|)
            (|BiCPO| |FiniteBiCPO|) (|ComplexCategory| |Complex|)
            (|DequeueAggregate| |Dequeue|)
            (|DistributionCategory| |Distribution|)
            (|FileNameCategory| |FileName|) (|FreeLieAlgebra| |LiePolynomial|)
            (|FunctionSpace| |Expression|) (|IntervalCategory| |Interval|)
            (|JetBundleBaseFunctionCategory| |JetBundleXExpression|)
            (|LazyStreamAggregate| |Stream|)
            (|MonoidRingCategory| |MonoidRing|)
            (|MultisetAggregate| |Multiset|) (|OctonionCategory| |Octonion|)
            (|PermutationCategory| |Permutation|)
            (|PlottableSpaceCurveCategory| |Plot3D|) (|PointCategory| |Point|)
            (|PriorityQueueAggregate| |Heap|)
            (|QuaternionCategory| |Quaternion|)
            (|RealRootCharacterizationCategory|
             |RightOpenIntervalRootCharacterization|)
            (|SequenceCategory| |Sequence|) (|StringCategory| |String|)
            (|ThreeSpaceCategory| |ThreeSpace|))))

; initial_get_database(display_messages) == nil

(DEFUN |initial_get_database| (|display_messages|) (PROG () (RETURN NIL)))

; $browse_stream := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$browse_stream| NIL))

; $category_stream := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$category_stream| NIL))

; $interp_stream := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$interp_stream| NIL))

; $operation_stream := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$operation_stream| NIL))

; $browse_stream_stamp := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$browse_stream_stamp| NIL))

; $category_stream_stamp := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$category_stream_stamp| NIL))

; $interp_stream_stamp := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$interp_stream_stamp| NIL))

; $operation_stream_stamp := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$operation_stream_stamp| NIL))

; handle_daase_file2(stream, name, o_stream, o_stamp, display_messages, fun) ==
;     stamp := READ(stream)
;     stamp = o_stamp => [stream, o_stamp]
;     if display_messages then
;         FORMAT(true, '"   Re-reading ~a.daase", name)
;     FILE_-POSITION(stream, first(stamp))
;     FUNCALL(fun, stream)
;     FORMAT(true, '"~&")
;     [stream, stamp]

(DEFUN |handle_daase_file2|
       (|stream| |name| |o_stream| |o_stamp| |display_messages| |fun|)
  (PROG (|stamp|)
    (RETURN
     (PROGN
      (SETQ |stamp| (READ |stream|))
      (COND ((EQUAL |stamp| |o_stamp|) (LIST |stream| |o_stamp|))
            ('T
             (PROGN
              (COND
               (|display_messages| (FORMAT T "   Re-reading ~a.daase" |name|)))
              (FILE-POSITION |stream| (CAR |stamp|))
              (FUNCALL |fun| |stream|)
              (FORMAT T "~&")
              (LIST |stream| |stamp|))))))))

; handle_daase_file(name, fun, display_messages, o_stream, o_stamp) ==
;     f_name := full_database_name(STRCONC(name, '".daase"))
;     stream := OPEN(f_name)
;     stamp := READ(stream)
;     stamp = o_stamp => [stream, o_stamp]
;     if display_messages then
;         FORMAT(true, '"   Re-reading ~a.daase", name)
;     FILE_-POSITION(stream, first(stamp))
;     FUNCALL(fun, stream)
;     FORMAT(true, '"~&")
;     [stream, stamp]

(DEFUN |handle_daase_file|
       (|name| |fun| |display_messages| |o_stream| |o_stamp|)
  (PROG (|f_name| |stream| |stamp|)
    (RETURN
     (PROGN
      (SETQ |f_name| (|full_database_name| (STRCONC |name| ".daase")))
      (SETQ |stream| (OPEN |f_name|))
      (SETQ |stamp| (READ |stream|))
      (COND ((EQUAL |stamp| |o_stamp|) (LIST |stream| |o_stamp|))
            ('T
             (PROGN
              (COND
               (|display_messages| (FORMAT T "   Re-reading ~a.daase" |name|)))
              (FILE-POSITION |stream| (CAR |stamp|))
              (FUNCALL |fun| |stream|)
              (FORMAT T "~&")
              (LIST |stream| |stamp|))))))))

; write_daase_file2(stream, fun) ==
;     -- Reseves space for stamp
;     PRINC('"                              ", stream)
;     master := FUNCALL(fun, stream)
;     write_stamp(master, stream)

(DEFUN |write_daase_file2| (|stream| |fun|)
  (PROG (|master|)
    (RETURN
     (PROGN
      (PRINC "                              " |stream|)
      (SETQ |master| (FUNCALL |fun| |stream|))
      (|write_stamp| |master| |stream|)))))

; write_daase_file(name, fun) ==
;     FORMAT(true, '"building ~a.daase", name)
;     handle_output_file(STRCONC(name, '".build"), function write_daase_file2,
;                        [fun])

(DEFUN |write_daase_file| (|name| |fun|)
  (PROG ()
    (RETURN
     (PROGN
      (FORMAT T "building ~a.daase" |name|)
      (|handle_output_file| (STRCONC |name| ".build") #'|write_daase_file2|
                            (LIST |fun|))))))

; full_database_name(name) ==
;     if env_v := getEnv('"DAASE") then
;         fname := STRCONC(env_v, '"/algebra/", name)
;         FORMAT(true, '"   Using local database ~a..", fname)
;         fname
;     else
;         STRCONC($spadroot, '"/algebra/", name)

(DEFUN |full_database_name| (|name|)
  (PROG (|env_v| |fname|)
    (RETURN
     (COND
      ((SETQ |env_v| (|getEnv| "DAASE"))
       (SETQ |fname| (STRCONC |env_v| "/algebra/" |name|))
       (FORMAT T "   Using local database ~a.." |fname|) |fname|)
      ('T (STRCONC |$spadroot| "/algebra/" |name|))))))

; move_database(name, condition) ==
;     fin_name := STRCONC(name, '".daase")
;     maybe_delete_file(fin_name)
;     if condition then
;         RENAME_-FILE(STRCONC(name, '".build"), fin_name)

(DEFUN |move_database| (|name| |condition|)
  (PROG (|fin_name|)
    (RETURN
     (PROGN
      (SETQ |fin_name| (STRCONC |name| ".daase"))
      (|maybe_delete_file| |fin_name|)
      (COND
       (|condition| (RENAME-FILE (STRCONC |name| ".build") |fin_name|)))))))

; reset_hash_tables(display_messages) ==
;     $has_category_hash := MAKE_HASHTABLE('EQUAL)
;     $operation_hash := MAKE_HASHTABLE('EQL)
;     $all_constructors := []
;     $interp_stream_stamp := [0, :0]
;     open_interp_db(display_messages)
;     $operation_stream_stamp := [0, :0]
;     open_operation_db(display_messages)
;     $browse_stream_stamp := [0, :0]
;     open_browse_db(display_messages)
;     $category_stream_stamp := [0, :0]
;     open_category_db(display_messages)
;     initial_get_database(display_messages)
;     CLOSE($interp_stream)
;     CLOSE($operation_stream)
;     CLOSE($category_stream)
;     CLOSE($browse_stream)
;     maybe_gc()

(DEFUN |reset_hash_tables| (|display_messages|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$has_category_hash| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$operation_hash| (MAKE_HASHTABLE 'EQL))
      (SETQ |$all_constructors| NIL)
      (SETQ |$interp_stream_stamp| (CONS 0 0))
      (|open_interp_db| |display_messages|)
      (SETQ |$operation_stream_stamp| (CONS 0 0))
      (|open_operation_db| |display_messages|)
      (SETQ |$browse_stream_stamp| (CONS 0 0))
      (|open_browse_db| |display_messages|)
      (SETQ |$category_stream_stamp| (CONS 0 0))
      (|open_category_db| |display_messages|)
      (|initial_get_database| |display_messages|)
      (CLOSE |$interp_stream|)
      (CLOSE |$operation_stream|)
      (CLOSE |$category_stream|)
      (CLOSE |$browse_stream|)
      (|maybe_gc|)))))

; $abbreviation_ind := 0

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$abbreviation_ind| 0))

; $ancestors_ind := 1

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$ancestors_ind| 1))

; $operationalist_ind := 2

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$operationalist_ind| 2))

; $constructorcategory_ind := 3

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$constructorcategory_ind| 3))

; $constructorkind_ind := 4

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$constructorkind_ind| 4))

; $constructormodemap_ind := 5

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$constructormodemap_ind| 5))

; $cosig_ind := 6

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$cosig_ind| 6))

; $object_ind := 7

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$object_ind| 7))

; $modemaps_ind := 8

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$modemaps_ind| 8))

; $niladic_ind := 9

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$niladic_ind| 9))

; $users_ind := 10

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$users_ind| 10))

; $dependents_ind := 11

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$dependents_ind| 11))

; $documentation_ind := 12

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$documentation_ind| 12))

; $constructorform_ind := 13

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$constructorform_ind| 13))

; $predicates_ind := 14

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$predicates_ind| 14))

; $sourcefile_ind := 15

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$sourcefile_ind| 15))

; make_dbstruct() == GETREFV(17)

(DEFUN |make_dbstruct| () (PROG () (RETURN (GETREFV 17))))

; init_dbstruct1(con, db_data) ==
;     dbstruct := make_dbstruct()
;     MAKEPROP(con, 'DATABASE, dbstruct)
;     dbstruct.$operationalist_ind := POP(db_data)
;     dbstruct.$constructormodemap_ind := POP(db_data)
;     dbstruct.$modemaps_ind := POP(db_data)
;     dbstruct.$object_ind := POP(db_data)
;     dbstruct.$constructorcategory_ind := POP(db_data)
;     dbstruct.$niladic_ind := POP(db_data)
;     dbstruct.$abbreviation_ind := abbr := POP(db_data)
;     MAKEPROP(abbr, 'ABBREVIATIONFOR, con)
;     dbstruct.$cosig_ind := POP(db_data)
;     dbstruct.$constructorkind_ind := POP(db_data)
;     dbstruct.$ancestors_ind := POP(db_data)

(DEFUN |init_dbstruct1| (|con| |db_data|)
  (PROG (|dbstruct| |abbr|)
    (RETURN
     (PROGN
      (SETQ |dbstruct| (|make_dbstruct|))
      (MAKEPROP |con| 'DATABASE |dbstruct|)
      (SETF (ELT |dbstruct| |$operationalist_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$constructormodemap_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$modemaps_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$object_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$constructorcategory_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$niladic_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$abbreviation_ind|) (SETQ |abbr| (POP |db_data|)))
      (MAKEPROP |abbr| 'ABBREVIATIONFOR |con|)
      (SETF (ELT |dbstruct| |$cosig_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$constructorkind_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$ancestors_ind|) (POP |db_data|))))))

; interp_open2(stream) ==
;     clean_symbols()
;     $all_constructors := []
;     constructors := READ(stream)
;     for db_data in constructors repeat
;         con := POP(db_data)
;         $all_constructors := ADJOIN(con, $all_constructors)
;         init_dbstruct1(con, db_data)

(DEFUN |interp_open2| (|stream|)
  (PROG (|constructors| |con|)
    (RETURN
     (PROGN
      (|clean_symbols|)
      (SETQ |$all_constructors| NIL)
      (SETQ |constructors| (READ |stream|))
      ((LAMBDA (|bfVar#1| |db_data|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |db_data| (CAR |bfVar#1|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |con| (POP |db_data|))
             (SETQ |$all_constructors| (ADJOIN |con| |$all_constructors|))
             (|init_dbstruct1| |con| |db_data|))))
          (SETQ |bfVar#1| (CDR |bfVar#1|))))
       |constructors| NIL)))))

; open_interp_db(display_messages) ==
;     res := handle_daase_file('"interp", function interp_open2,
;                              display_messages, $interp_stream,
;                              $interp_stream_stamp)
;     $interp_stream := first(res)
;     $interp_stream_stamp := first(rest(res))

(DEFUN |open_interp_db| (|display_messages|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res|
              (|handle_daase_file| "interp" #'|interp_open2| |display_messages|
               |$interp_stream| |$interp_stream_stamp|))
      (SETQ |$interp_stream| (CAR |res|))
      (SETQ |$interp_stream_stamp| (CAR (CDR |res|)))))))

; init_dbstruct2(db_data) ==
;     con := first(db_data)
;     dbstruct := GET(con, 'DATABASE)
;     if not(dbstruct) then
;         FORMAT(true, "browseOpen:~%")
;         FORMAT(true, "the browse database contains a data ~a~%", db_data)
;         FORMAT(true, "for which we cannot get the database structure.~%")
;         FORMAT(true, "Creating a new one~%")
;         dbstruct := make_dbstruct()
;         MAKEPROP(con, 'DATABASE, dbstruct)
;         $all_constructors := ADJOIN(con, $all_constructors)
;     db_data := rest(db_data)
;     dbstruct.$sourcefile_ind := POP(db_data)
;     dbstruct.$constructorform_ind := POP(db_data)
;     dbstruct.$documentation_ind := POP(db_data)
;     dbstruct.$predicates_ind := POP(db_data)

(DEFUN |init_dbstruct2| (|db_data|)
  (PROG (|con| |dbstruct|)
    (RETURN
     (PROGN
      (SETQ |con| (CAR |db_data|))
      (SETQ |dbstruct| (GET |con| 'DATABASE))
      (COND
       ((NULL |dbstruct|) (FORMAT T '|browseOpen:~%|)
        (FORMAT T '|the browse database contains a data ~a~%| |db_data|)
        (FORMAT T '|for which we cannot get the database structure.~%|)
        (FORMAT T '|Creating a new one~%|) (SETQ |dbstruct| (|make_dbstruct|))
        (MAKEPROP |con| 'DATABASE |dbstruct|)
        (SETQ |$all_constructors| (ADJOIN |con| |$all_constructors|))))
      (SETQ |db_data| (CDR |db_data|))
      (SETF (ELT |dbstruct| |$sourcefile_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$constructorform_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$documentation_ind|) (POP |db_data|))
      (SETF (ELT |dbstruct| |$predicates_ind|) (POP |db_data|))))))

; browse_open2(stream) ==
;     constructors := READ(stream)
;     for db_data in constructors repeat
;         init_dbstruct2(db_data)

(DEFUN |browse_open2| (|stream|)
  (PROG (|constructors|)
    (RETURN
     (PROGN
      (SETQ |constructors| (READ |stream|))
      ((LAMBDA (|bfVar#2| |db_data|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |db_data| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           ('T (|init_dbstruct2| |db_data|)))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |constructors| NIL)))))

; open_browse_db(display_messages) ==
;     res := handle_daase_file('"browse", function browse_open2,
;                              display_messages, $browse_stream,
;                              $browse_stream_stamp)
;     $browse_stream := first(res)
;     $browse_stream_stamp := first(rest(res))

(DEFUN |open_browse_db| (|display_messages|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res|
              (|handle_daase_file| "browse" #'|browse_open2| |display_messages|
               |$browse_stream| |$browse_stream_stamp|))
      (SETQ |$browse_stream| (CAR |res|))
      (SETQ |$browse_stream_stamp| (CAR (CDR |res|)))))))

; category_open2(stream) ==
;     $has_category_hash := MAKE_HASHTABLE('EQUAL)
;     keys := READ(stream)
;     for key_val in keys repeat
;         HPUT($has_category_hash, first(key_val), first(rest(key_val)))

(DEFUN |category_open2| (|stream|)
  (PROG (|keys|)
    (RETURN
     (PROGN
      (SETQ |$has_category_hash| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |keys| (READ |stream|))
      ((LAMBDA (|bfVar#3| |key_val|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |key_val| (CAR |bfVar#3|)) NIL))
            (RETURN NIL))
           ('T
            (HPUT |$has_category_hash| (CAR |key_val|) (CAR (CDR |key_val|)))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       |keys| NIL)))))

; open_category_db(display_messages) ==
;     res := handle_daase_file('"category", function category_open2,
;                              display_messages, $category_stream,
;                              $category_stream_stamp)
;     $category_stream := first(res)
;     $category_stream_stamp := first(rest(res))

(DEFUN |open_category_db| (|display_messages|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res|
              (|handle_daase_file| "category" #'|category_open2|
               |display_messages| |$category_stream| |$category_stream_stamp|))
      (SETQ |$category_stream| (CAR |res|))
      (SETQ |$category_stream_stamp| (CAR (CDR |res|)))))))

; operation_open2(stream) ==
;     $all_operations := []
;     $operation_hash := MAKE_HASHTABLE('EQL)
;     keys := READ(stream)
;     for key_val in keys repeat
;         HPUT($operation_hash, first(key_val), rest(key_val))

(DEFUN |operation_open2| (|stream|)
  (PROG (|keys|)
    (RETURN
     (PROGN
      (SETQ |$all_operations| NIL)
      (SETQ |$operation_hash| (MAKE_HASHTABLE 'EQL))
      (SETQ |keys| (READ |stream|))
      ((LAMBDA (|bfVar#4| |key_val|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |key_val| (CAR |bfVar#4|)) NIL))
            (RETURN NIL))
           ('T (HPUT |$operation_hash| (CAR |key_val|) (CDR |key_val|))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       |keys| NIL)))))

; open_operation_db(display_messages) ==
;     res := handle_daase_file('"operation", function operation_open2,
;                              display_messages, $operation_stream,
;                              $operation_stream_stamp)
;     $operation_stream := first(res)
;     $operation_stream_stamp := first(rest(res))

(DEFUN |open_operation_db| (|display_messages|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res|
              (|handle_daase_file| "operation" #'|operation_open2|
               |display_messages| |$operation_stream|
               |$operation_stream_stamp|))
      (SETQ |$operation_stream| (CAR |res|))
      (SETQ |$operation_stream_stamp| (CAR (CDR |res|)))))))

; SHOWDATABASE(con) ==
;     f_descs := [['n, 'CONSTRUCTORKIND], ['n, 'COSIG], _
;                 ['n, 'OPERATION], ['p, 'CONSTRUCTORMODEMAP], _
;                 ['p, 'CONSTRUCTORCATEGORY], ['p, 'OPERATIONALIST], _
;                 ['p, 'MODEMAPS], ['n, 'HASCATEGORY], _
;                 ['n, 'OBJECT], ['n, 'NILADIC], _
;                 ['n, 'ABBREVIATION], ['n, 'CONSTRUCTOR], _
;                 ['n, 'DEFAULTDOMAIN], ['n, 'ANCESTORS], _
;                 ['n, 'SOURCEFILE], ['n, 'CONSTRUCTORFORM], _
;                 ['n, 'CONSTRUCTORARGS], ['p, 'PREDICATES], _
;                 ['n, 'DOCUMENTATION]]
;     for f_desc in f_descs repeat
;         ft := first(f_desc)
;         fn := first(rest(f_desc))
;         ft = 'n =>
;             FORMAT(true, '"~&~a: ~a~%", fn, get_database(con, fn))
;         ft = 'p =>
;             FORMAT(true, '"~&~a: ", fn)
;             PPRINT(get_database(con, fn))
;         BREAK()

(DEFUN SHOWDATABASE (|con|)
  (PROG (|f_descs| |ft| |fn|)
    (RETURN
     (PROGN
      (SETQ |f_descs|
              (LIST (LIST '|n| 'CONSTRUCTORKIND) (LIST '|n| 'COSIG)
                    (LIST '|n| 'OPERATION) (LIST '|p| 'CONSTRUCTORMODEMAP)
                    (LIST '|p| 'CONSTRUCTORCATEGORY)
                    (LIST '|p| 'OPERATIONALIST) (LIST '|p| 'MODEMAPS)
                    (LIST '|n| 'HASCATEGORY) (LIST '|n| 'OBJECT)
                    (LIST '|n| 'NILADIC) (LIST '|n| 'ABBREVIATION)
                    (LIST '|n| 'CONSTRUCTOR) (LIST '|n| 'DEFAULTDOMAIN)
                    (LIST '|n| 'ANCESTORS) (LIST '|n| 'SOURCEFILE)
                    (LIST '|n| 'CONSTRUCTORFORM) (LIST '|n| 'CONSTRUCTORARGS)
                    (LIST '|p| 'PREDICATES) (LIST '|n| 'DOCUMENTATION)))
      ((LAMBDA (|bfVar#5| |f_desc|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#5|) (PROGN (SETQ |f_desc| (CAR |bfVar#5|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |ft| (CAR |f_desc|))
             (SETQ |fn| (CAR (CDR |f_desc|)))
             (COND
              ((EQ |ft| '|n|)
               (FORMAT T "~&~a: ~a~%" |fn| (|get_database| |con| |fn|)))
              ((EQ |ft| '|p|)
               (PROGN
                (FORMAT T "~&~a: " |fn|)
                (PPRINT (|get_database| |con| |fn|))))
              (#1# (BREAK))))))
          (SETQ |bfVar#5| (CDR |bfVar#5|))))
       |f_descs| NIL)))))

; SETDATABASE(con, key, val) ==
;     if SYMBOLP(con) then
;         dbstruct := GET(con, 'DATABASE)
;         if not(dbstruct) then
;             dbstruct := make_dbstruct()
;             MAKEPROP(con, 'DATABASE, dbstruct)
;         key = 'ABBREVIATION =>
;             dbstruct.$abbreviation_ind := val
;             if SYMBOLP(val) then
;                 MAKEPROP(val, 'ABBREVIATIONFOR, con)
;         key = 'NILADIC =>
;             dbstruct.$niladic_ind := val
;         key = 'COSIG =>
;             dbstruct.$cosig_ind := val
;         key = 'CONSTRUCTORMODEMAP =>
;             dbstruct.$constructormodemap_ind := val
;         key = 'CONSTRUCTORCATEGORY =>
;             dbstruct.$constructorcategory_ind := val
;         key = 'CONSTRUCTORKIND =>
;             dbstruct.$constructorkind_ind := val

(DEFUN SETDATABASE (|con| |key| |val|)
  (PROG (|dbstruct|)
    (RETURN
     (COND
      ((SYMBOLP |con|) (SETQ |dbstruct| (GET |con| 'DATABASE))
       (COND
        ((NULL |dbstruct|) (SETQ |dbstruct| (|make_dbstruct|))
         (MAKEPROP |con| 'DATABASE |dbstruct|)))
       (COND
        ((EQ |key| 'ABBREVIATION)
         (PROGN
          (SETF (ELT |dbstruct| |$abbreviation_ind|) |val|)
          (COND ((SYMBOLP |val|) (MAKEPROP |val| 'ABBREVIATIONFOR |con|)))))
        ((EQ |key| 'NILADIC) (SETF (ELT |dbstruct| |$niladic_ind|) |val|))
        ((EQ |key| 'COSIG) (SETF (ELT |dbstruct| |$cosig_ind|) |val|))
        ((EQ |key| 'CONSTRUCTORMODEMAP)
         (SETF (ELT |dbstruct| |$constructormodemap_ind|) |val|))
        ((EQ |key| 'CONSTRUCTORCATEGORY)
         (SETF (ELT |dbstruct| |$constructorcategory_ind|) |val|))
        ((EQ |key| 'CONSTRUCTORKIND)
         (SETF (ELT |dbstruct| |$constructorkind_ind|) |val|))))))))

; DELDATABASE(con, key) ==
;     if SYMBOLP(con) then
;         if key = 'ABBREVIATION then
;             MAKEPROP(con, 'ABBREVIATIONFOR, nil)

(DEFUN DELDATABASE (|con| |key|)
  (PROG ()
    (RETURN
     (COND
      ((SYMBOLP |con|)
       (COND
        ((EQ |key| 'ABBREVIATION) (MAKEPROP |con| 'ABBREVIATIONFOR NIL))))))))

; $miss := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$miss| NIL))

; get_data_from_file(con, key, data, stream) ==
;     if $miss then
;         FORMAT(true, '"get_database miss: ~20a ~a~%", con, key)
;     FILE_-POSITION(stream, data)
;     READ(stream)

(DEFUN |get_data_from_file| (|con| |key| |data| |stream|)
  (PROG ()
    (RETURN
     (PROGN
      (COND (|$miss| (FORMAT T "get_database miss: ~20a ~a~%" |con| |key|)))
      (FILE-POSITION |stream| |data|)
      (READ |stream|)))))

; get_database2(con, key, ind, stream) ==
;     dbstruct := GET(con, 'DATABASE)
;     NULL(dbstruct) => nil
;     data := dbstruct.ind
;     if NULL(data) and key = 'CONSTRUCTORCATEGORY then
;         data := first(rest(first(
;                     get_database(con, 'CONSTRUCTORMODEMAP))))
;     if NUMBERP(data) then
;         data := get_data_from_file(con, key, data, stream)
;         dbstruct.ind := data
;     NULL(data) => nil
;     if key = 'SOURCEFILE then
;         if NULL(PATHNAME_-DIRECTORY(data)) and
;            PATHNAME_-TYPE(data) = '"spad" then
;             data := STRCONC($spadroot, '"/../../src/algebra/", data)
;     if key = 'OBJECT then
;         if CONSP(data) then
;             data := first(data)
;         if NULL(PATHNAME_-DIRECTORY(data)) then
;             data := STRCONC($spadroot, '"/algebra/", data,
;                            '".", $lisp_bin_filetype)
;     data

(DEFUN |get_database2| (|con| |key| |ind| |stream|)
  (PROG (|dbstruct| |data|)
    (RETURN
     (PROGN
      (SETQ |dbstruct| (GET |con| 'DATABASE))
      (COND ((NULL |dbstruct|) NIL)
            (#1='T
             (PROGN
              (SETQ |data| (ELT |dbstruct| |ind|))
              (COND
               ((AND (NULL |data|) (EQ |key| 'CONSTRUCTORCATEGORY))
                (SETQ |data|
                        (CAR
                         (CDR
                          (CAR (|get_database| |con| 'CONSTRUCTORMODEMAP)))))))
              (COND
               ((NUMBERP |data|)
                (SETQ |data|
                        (|get_data_from_file| |con| |key| |data| |stream|))
                (SETF (ELT |dbstruct| |ind|) |data|)))
              (COND ((NULL |data|) NIL)
                    (#1#
                     (PROGN
                      (COND
                       ((EQ |key| 'SOURCEFILE)
                        (COND
                         ((AND (NULL (PATHNAME-DIRECTORY |data|))
                               (EQUAL (PATHNAME-TYPE |data|) "spad"))
                          (SETQ |data|
                                  (STRCONC |$spadroot| "/../../src/algebra/"
                                   |data|))))))
                      (COND
                       ((EQ |key| 'OBJECT)
                        (COND ((CONSP |data|) (SETQ |data| (CAR |data|))))
                        (COND
                         ((NULL (PATHNAME-DIRECTORY |data|))
                          (SETQ |data|
                                  (STRCONC |$spadroot| "/algebra/" |data| "."
                                   |$lisp_bin_filetype|))))))
                      |data|))))))))))

; get_database3(con, key, hash, stream) ==
;     data := HGET(hash, con)
;     NULL(data) => nil
;     if NUMBERP(data) then
;         data := get_data_from_file(con, key, data, stream)
;         HPUT(hash, con, data)
;     data

(DEFUN |get_database3| (|con| |key| |hash| |stream|)
  (PROG (|data|)
    (RETURN
     (PROGN
      (SETQ |data| (HGET |hash| |con|))
      (COND ((NULL |data|) NIL)
            ('T
             (PROGN
              (COND
               ((NUMBERP |data|)
                (SETQ |data|
                        (|get_data_from_file| |con| |key| |data| |stream|))
                (HPUT |hash| |con| |data|)))
              |data|)))))))

; get_database(con, key) ==
;     if $miss then
;         FORMAT(true, '"get_database call: ~20a ~a~%", con, key)
;     key = 'HASCATEGORY and PAIRP(con) =>
;         get_database3(con, key, $has_category_hash, $category_stream)
;     key = 'HASCATEGORY => nil
;     not(SYMBOLP(con)) => nil
;     key = 'ABBREVIATION =>
;         get_database2(con, key, $abbreviation_ind, $interp_stream)
;     key = 'CONSTRUCTORKIND =>
;         get_database2(con, key, $constructorkind_ind, $interp_stream)
;     key = 'COSIG =>
;         get_database2(con, key, $cosig_ind, $interp_stream)
;     key = 'OPERATION =>
;         get_database3(con, key, $operation_hash, $operation_stream)
;     key = 'CONSTRUCTORMODEMAP =>
;         get_database2(con, key, $constructormodemap_ind, $interp_stream)
;     key = 'CONSTRUCTORCATEGORY =>
;         get_database2(con, key, $constructorcategory_ind, $interp_stream)
;     key = 'OPERATIONALIST =>
;         get_database2(con, key, $operationalist_ind, $interp_stream)
;     key = 'MODEMAPS =>
;         get_database2(con, key, $modemaps_ind, $interp_stream)
;     key = 'OBJECT =>
;         get_database2(con, key, $object_ind, $interp_stream)
;     key = 'ASHARP? =>
;         dbstruct := GET(con, 'DATABASE)
;         NULL(dbstruct) => nil
;         data := dbstruct.$object_ind
;         if NUMBERP(data) then
;             data := get_data_from_file(con, key, data, $interp_stream)
;         CONSP(data) => rest(data)
;         nil
;     key = 'NILADIC =>
;         get_database2(con, key, $niladic_ind, $interp_stream)
;     key = 'SUPERDOMAIN =>
;         con = "NonNegativeInteger" =>
;             [["Integer"],
;               ["IF", ["<", "#1", 0], "false", "true"]]
;         con = "PositiveInteger" => [["NonNegativeInteger"], ["<", 0, "#1"]]
;         nil
;     key = 'CONSTRUCTOR =>
;         GET(con, 'ABBREVIATIONFOR)
;     key = 'DEFAULTDOMAIN =>
;         first(rest(ASSOC(con, $defaultdomain_list)))
;     key = 'ANCESTORS =>
;         get_database2(con, key, $ancestors_ind, $interp_stream)
;     key = 'SOURCEFILE =>
;         get_database2(con, key, $sourcefile_ind, $browse_stream)
;     key = 'CONSTRUCTORFORM =>
;         get_database2(con, key, $constructorform_ind, $browse_stream)
;     key = 'CONSTRUCTORARGS =>
;         rest(get_database(con, 'CONSTRUCTORFORM))
;     key = 'PREDICATES =>
;         get_database2(con, key, $predicates_ind, $browse_stream)
;     key = 'DOCUMENTATION =>
;         get_database2(con, key, $documentation_ind, $browse_stream)
;     key = 'USERS =>
;         get_database2(con, key, $users_ind, $browse_stream)
;     key = 'DEPENDENTS =>
;         get_database2(con, key, $dependents_ind, $browse_stream)
;     WARN('"~%(get_database ~a ~a) failed~%", con, key)
;     nil

(DEFUN |get_database| (|con| |key|)
  (PROG (|dbstruct| |data|)
    (RETURN
     (PROGN
      (COND (|$miss| (FORMAT T "get_database call: ~20a ~a~%" |con| |key|)))
      (COND
       ((AND (EQ |key| 'HASCATEGORY) (CONSP |con|))
        (|get_database3| |con| |key| |$has_category_hash| |$category_stream|))
       ((EQ |key| 'HASCATEGORY) NIL) ((NULL (SYMBOLP |con|)) NIL)
       ((EQ |key| 'ABBREVIATION)
        (|get_database2| |con| |key| |$abbreviation_ind| |$interp_stream|))
       ((EQ |key| 'CONSTRUCTORKIND)
        (|get_database2| |con| |key| |$constructorkind_ind| |$interp_stream|))
       ((EQ |key| 'COSIG)
        (|get_database2| |con| |key| |$cosig_ind| |$interp_stream|))
       ((EQ |key| 'OPERATION)
        (|get_database3| |con| |key| |$operation_hash| |$operation_stream|))
       ((EQ |key| 'CONSTRUCTORMODEMAP)
        (|get_database2| |con| |key| |$constructormodemap_ind|
         |$interp_stream|))
       ((EQ |key| 'CONSTRUCTORCATEGORY)
        (|get_database2| |con| |key| |$constructorcategory_ind|
         |$interp_stream|))
       ((EQ |key| 'OPERATIONALIST)
        (|get_database2| |con| |key| |$operationalist_ind| |$interp_stream|))
       ((EQ |key| 'MODEMAPS)
        (|get_database2| |con| |key| |$modemaps_ind| |$interp_stream|))
       ((EQ |key| 'OBJECT)
        (|get_database2| |con| |key| |$object_ind| |$interp_stream|))
       ((EQ |key| 'ASHARP?)
        (PROGN
         (SETQ |dbstruct| (GET |con| 'DATABASE))
         (COND ((NULL |dbstruct|) NIL)
               (#1='T
                (PROGN
                 (SETQ |data| (ELT |dbstruct| |$object_ind|))
                 (COND
                  ((NUMBERP |data|)
                   (SETQ |data|
                           (|get_data_from_file| |con| |key| |data|
                            |$interp_stream|))))
                 (COND ((CONSP |data|) (CDR |data|)) (#1# NIL)))))))
       ((EQ |key| 'NILADIC)
        (|get_database2| |con| |key| |$niladic_ind| |$interp_stream|))
       ((EQ |key| 'SUPERDOMAIN)
        (COND
         ((EQ |con| '|NonNegativeInteger|)
          (LIST (LIST '|Integer|)
                (LIST 'IF (LIST '< '|#1| 0) '|false| '|true|)))
         ((EQ |con| '|PositiveInteger|)
          (LIST (LIST '|NonNegativeInteger|) (LIST '< 0 '|#1|)))
         (#1# NIL)))
       ((EQ |key| 'CONSTRUCTOR) (GET |con| 'ABBREVIATIONFOR))
       ((EQ |key| 'DEFAULTDOMAIN)
        (CAR (CDR (ASSOC |con| |$defaultdomain_list|))))
       ((EQ |key| 'ANCESTORS)
        (|get_database2| |con| |key| |$ancestors_ind| |$interp_stream|))
       ((EQ |key| 'SOURCEFILE)
        (|get_database2| |con| |key| |$sourcefile_ind| |$browse_stream|))
       ((EQ |key| 'CONSTRUCTORFORM)
        (|get_database2| |con| |key| |$constructorform_ind| |$browse_stream|))
       ((EQ |key| 'CONSTRUCTORARGS)
        (CDR (|get_database| |con| 'CONSTRUCTORFORM)))
       ((EQ |key| 'PREDICATES)
        (|get_database2| |con| |key| |$predicates_ind| |$browse_stream|))
       ((EQ |key| 'DOCUMENTATION)
        (|get_database2| |con| |key| |$documentation_ind| |$browse_stream|))
       ((EQ |key| 'USERS)
        (|get_database2| |con| |key| |$users_ind| |$browse_stream|))
       ((EQ |key| 'DEPENDENTS)
        (|get_database2| |con| |key| |$dependents_ind| |$browse_stream|))
       (#1#
        (PROGN (WARN "~%(get_database ~a ~a) failed~%" |con| |key|) NIL)))))))

; compute_cosig(con_modemap) ==
;     [NIL, :MAPCAR(FUNCTION categoryForm?, rest(rest(first(con_modemap))))]

(DEFUN |compute_cosig| (|con_modemap|)
  (PROG ()
    (RETURN
     (CONS NIL (MAPCAR #'|categoryForm?| (CDR (CDR (CAR |con_modemap|))))))))

; set_dbstruct(dbstruct, fetch_data, ds, strip_path?, constructorform,
;              abbrev, object) ==
;     dbstruct.$constructorform_ind := constructorform
;     dbstruct.$abbreviation_ind := abbrev
;     dbstruct.$operationalist_ind :=
;         FUNCALL(fetch_data, ds, '"operationAlist")
;     dbstruct.$constructormodemap_ind :=
;         FUNCALL(fetch_data, ds, '"constructorModemap")
;     dbstruct.$modemaps_ind :=
;         FUNCALL(fetch_data, ds, "modemaps")
;     source_file := FUNCALL(fetch_data, ds, "sourceFile")
;     if strip_path? then
;         source_file := FILE_-NAMESTRING(source_file)
;     dbstruct.$sourcefile_ind := source_file
;     kind := FUNCALL(fetch_data, ds, '"constructorKind")
;     dbstruct.$constructorkind_ind := kind
;     dbstruct.$constructorcategory_ind :=
;         FUNCALL(fetch_data, ds, '"constructorCategory")
;     dbstruct.$documentation_ind :=
;         FUNCALL(fetch_data, ds, '"documentation")
;     dbstruct.$predicates_ind :=
;         FUNCALL(fetch_data, ds, '"predicates")
;     dbstruct.$niladic_ind :=
;         FUNCALL(fetch_data, ds, '"NILADIC")
;     dbstruct.$cosig_ind :=
;         compute_cosig(dbstruct.$constructormodemap_ind)
;     dbstruct.$object_ind := object
;     kind

(DEFUN |set_dbstruct|
       (|dbstruct| |fetch_data| |ds| |strip_path?| |constructorform| |abbrev|
        |object|)
  (PROG (|source_file| |kind|)
    (RETURN
     (PROGN
      (SETF (ELT |dbstruct| |$constructorform_ind|) |constructorform|)
      (SETF (ELT |dbstruct| |$abbreviation_ind|) |abbrev|)
      (SETF (ELT |dbstruct| |$operationalist_ind|)
              (FUNCALL |fetch_data| |ds| "operationAlist"))
      (SETF (ELT |dbstruct| |$constructormodemap_ind|)
              (FUNCALL |fetch_data| |ds| "constructorModemap"))
      (SETF (ELT |dbstruct| |$modemaps_ind|)
              (FUNCALL |fetch_data| |ds| '|modemaps|))
      (SETQ |source_file| (FUNCALL |fetch_data| |ds| '|sourceFile|))
      (COND
       (|strip_path?| (SETQ |source_file| (FILE-NAMESTRING |source_file|))))
      (SETF (ELT |dbstruct| |$sourcefile_ind|) |source_file|)
      (SETQ |kind| (FUNCALL |fetch_data| |ds| "constructorKind"))
      (SETF (ELT |dbstruct| |$constructorkind_ind|) |kind|)
      (SETF (ELT |dbstruct| |$constructorcategory_ind|)
              (FUNCALL |fetch_data| |ds| "constructorCategory"))
      (SETF (ELT |dbstruct| |$documentation_ind|)
              (FUNCALL |fetch_data| |ds| "documentation"))
      (SETF (ELT |dbstruct| |$predicates_ind|)
              (FUNCALL |fetch_data| |ds| "predicates"))
      (SETF (ELT |dbstruct| |$niladic_ind|)
              (FUNCALL |fetch_data| |ds| "NILADIC"))
      (SETF (ELT |dbstruct| |$cosig_ind|)
              (|compute_cosig| (ELT |dbstruct| |$constructormodemap_ind|)))
      (SETF (ELT |dbstruct| |$object_ind|) |object|)
      |kind|))))

; make_special_constructor1(con, niladic, kind) ==
;     dbstruct := make_dbstruct()
;     MAKEPROP(con, 'DATABASE, dbstruct)
;     dbstruct.$operationalist_ind := []
;     dbstruct.$niladic_ind := niladic
;     dbstruct.$constructorkind_ind := kind
;     PUSH(con, $all_constructors)

(DEFUN |make_special_constructor1| (|con| |niladic| |kind|)
  (PROG (|dbstruct|)
    (RETURN
     (PROGN
      (SETQ |dbstruct| (|make_dbstruct|))
      (MAKEPROP |con| 'DATABASE |dbstruct|)
      (SETF (ELT |dbstruct| |$operationalist_ind|) NIL)
      (SETF (ELT |dbstruct| |$niladic_ind|) |niladic|)
      (SETF (ELT |dbstruct| |$constructorkind_ind|) |kind|)
      (PUSH |con| |$all_constructors|)))))

; make_special_constructors() ==
;     make_special_constructor1('Category, true, 'category)
;     make_special_constructor1('Record, false, 'domain)
;     make_special_constructor1('Union, false, 'domain)
;     make_special_constructor1('Mapping, false, 'domain)
;     make_special_constructor1('Enumeration, false, 'domain)

(DEFUN |make_special_constructors| ()
  (PROG ()
    (RETURN
     (PROGN
      (|make_special_constructor1| '|Category| T '|category|)
      (|make_special_constructor1| '|Record| NIL '|domain|)
      (|make_special_constructor1| '|Union| NIL '|domain|)
      (|make_special_constructor1| '|Mapping| NIL '|domain|)
      (|make_special_constructor1| '|Enumeration| NIL '|domain|)))))

; finish_con_dbstruct(con) ==
;     dbstruct := GET(con, 'DATABASE)
;     NULL(dbstruct) => nil
;     dbstruct.$cosig_ind := compute_cosig(dbstruct.$constructormodemap_ind)

(DEFUN |finish_con_dbstruct| (|con|)
  (PROG (|dbstruct|)
    (RETURN
     (PROGN
      (SETQ |dbstruct| (GET |con| 'DATABASE))
      (COND ((NULL |dbstruct|) NIL)
            ('T
             (SETF (ELT |dbstruct| |$cosig_ind|)
                     (|compute_cosig|
                      (ELT |dbstruct| |$constructormodemap_ind|)))))))))

; print_db_item(stream, item) ==
;     res := FILE_-POSITION(stream)
;     PRINT(item, stream)
;     res

(DEFUN |print_db_item| (|stream| |item|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res| (FILE-POSITION |stream|))
      (PRINT |item| |stream|)
      |res|))))

; store_con_data1(con, stream) ==
;     dbstruct := GET(con, 'DATABASE)
;     opalistpos := print_db_item(stream, dbstruct.$operationalist_ind)
;     cmodemappos := print_db_item(stream, dbstruct.$constructormodemap_ind)
;     modemapspos := print_db_item(stream, dbstruct.$modemaps_ind)
;     dob := dbstruct.$object_ind
;     obj :=
;         CONSP(dob) => -- asharp code
;             [PATHNAME_-NAME(first(dob)), :rest(dob)]
;         not(NULL(dob)) =>
;             PATHNAME_-NAME(last(PATHNAME_-DIRECTORY(dob)))
;         '"NIL"
;     concategory := dbstruct.$constructorcategory_ind
;     if concategory then
;         categorypos := print_db_item(stream, concategory)
;     else
;         categorypos := nil
;     niladic := dbstruct.$niladic_ind
;     abbrev := dbstruct.$abbreviation_ind
;     cosig := dbstruct.$cosig_ind
;     kind := dbstruct.$constructorkind_ind
;     ancestors := HGET($ancestors_hash, con)
;     if ancestors then
;         ancestorspos := print_db_item(stream, ancestors)
;     else
;         ancestorspos := nil
;     [con, opalistpos, cmodemappos, modemapspos, obj, categorypos,
;       niladic, abbrev, cosig, kind, ancestorspos]

(DEFUN |store_con_data1| (|con| |stream|)
  (PROG (|dbstruct| |opalistpos| |cmodemappos| |modemapspos| |dob| |obj|
         |concategory| |categorypos| |niladic| |abbrev| |cosig| |kind|
         |ancestors| |ancestorspos|)
    (RETURN
     (PROGN
      (SETQ |dbstruct| (GET |con| 'DATABASE))
      (SETQ |opalistpos|
              (|print_db_item| |stream|
               (ELT |dbstruct| |$operationalist_ind|)))
      (SETQ |cmodemappos|
              (|print_db_item| |stream|
               (ELT |dbstruct| |$constructormodemap_ind|)))
      (SETQ |modemapspos|
              (|print_db_item| |stream| (ELT |dbstruct| |$modemaps_ind|)))
      (SETQ |dob| (ELT |dbstruct| |$object_ind|))
      (SETQ |obj|
              (COND
               ((CONSP |dob|) (CONS (PATHNAME-NAME (CAR |dob|)) (CDR |dob|)))
               ((NULL (NULL |dob|))
                (PATHNAME-NAME (|last| (PATHNAME-DIRECTORY |dob|))))
               (#1='T "NIL")))
      (SETQ |concategory| (ELT |dbstruct| |$constructorcategory_ind|))
      (COND
       (|concategory|
        (SETQ |categorypos| (|print_db_item| |stream| |concategory|)))
       (#1# (SETQ |categorypos| NIL)))
      (SETQ |niladic| (ELT |dbstruct| |$niladic_ind|))
      (SETQ |abbrev| (ELT |dbstruct| |$abbreviation_ind|))
      (SETQ |cosig| (ELT |dbstruct| |$cosig_ind|))
      (SETQ |kind| (ELT |dbstruct| |$constructorkind_ind|))
      (SETQ |ancestors| (HGET |$ancestors_hash| |con|))
      (COND
       (|ancestors|
        (SETQ |ancestorspos| (|print_db_item| |stream| |ancestors|)))
       (#1# (SETQ |ancestorspos| NIL)))
      (LIST |con| |opalistpos| |cmodemappos| |modemapspos| |obj| |categorypos|
            |niladic| |abbrev| |cosig| |kind| |ancestorspos|)))))

; store_interp_data(stream) ==
;     master := []
;     for con in allConstructors() repeat
;         master := [store_con_data1(con, stream), :master]
;     print_db_item(stream, master)

(DEFUN |store_interp_data| (|stream|)
  (PROG (|master|)
    (RETURN
     (PROGN
      (SETQ |master| NIL)
      ((LAMBDA (|bfVar#6| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |con| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           ('T
            (SETQ |master|
                    (CONS (|store_con_data1| |con| |stream|) |master|))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))))
       (|allConstructors|) NIL)
      (|print_db_item| |stream| |master|)))))

; write_interpdb() ==
;     write_daase_file('"interp", function store_interp_data)

(DEFUN |write_interpdb| ()
  (PROG () (RETURN (|write_daase_file| "interp" #'|store_interp_data|))))

; store_con_data2(con, stream) ==
;     dbstruct := GET(con, 'DATABASE)
;     src := dbstruct.$sourcefile_ind
;     formpos := print_db_item(stream, dbstruct.$constructorform_ind)
;     docpos := print_db_item(stream, dbstruct.$documentation_ind)
;     predpos := print_db_item(stream, dbstruct.$predicates_ind)
;     [con, src, formpos, docpos, predpos]

(DEFUN |store_con_data2| (|con| |stream|)
  (PROG (|dbstruct| |src| |formpos| |docpos| |predpos|)
    (RETURN
     (PROGN
      (SETQ |dbstruct| (GET |con| 'DATABASE))
      (SETQ |src| (ELT |dbstruct| |$sourcefile_ind|))
      (SETQ |formpos|
              (|print_db_item| |stream|
               (ELT |dbstruct| |$constructorform_ind|)))
      (SETQ |docpos|
              (|print_db_item| |stream| (ELT |dbstruct| |$documentation_ind|)))
      (SETQ |predpos|
              (|print_db_item| |stream| (ELT |dbstruct| |$predicates_ind|)))
      (LIST |con| |src| |formpos| |docpos| |predpos|)))))

; store_browse_data(stream) ==
;     master := []
;     for con in allConstructors() repeat
;         master := [store_con_data2(con, stream), :master]
;     print_db_item(stream, master)

(DEFUN |store_browse_data| (|stream|)
  (PROG (|master|)
    (RETURN
     (PROGN
      (SETQ |master| NIL)
      ((LAMBDA (|bfVar#7| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#7|) (PROGN (SETQ |con| (CAR |bfVar#7|)) NIL))
            (RETURN NIL))
           ('T
            (SETQ |master|
                    (CONS (|store_con_data2| |con| |stream|) |master|))))
          (SETQ |bfVar#7| (CDR |bfVar#7|))))
       (|allConstructors|) NIL)
      (|print_db_item| |stream| |master|)))))

; write_browsedb() ==
;     write_daase_file('"browse", function store_browse_data)

(DEFUN |write_browsedb| ()
  (PROG () (RETURN (|write_daase_file| "browse" #'|store_browse_data|))))

; store_category_data(stream) ==
;     genCategoryTable()
;     $store_category_data_mater := []
;     for key_val in nreverse(H_KEY_VALS($has_category_hash)) repeat
;         key := first(key_val)
;         val := rest(key_val)
;         posv :=
;             NULL(val) or val = true => val
;             print_db_item(stream, val)
;         master := [[key, posv], :master]
;     print_db_item(stream, master)

(DEFUN |store_category_data| (|stream|)
  (PROG (|key| |val| |posv| |master|)
    (RETURN
     (PROGN
      (|genCategoryTable|)
      (SETQ |$store_category_data_mater| NIL)
      ((LAMBDA (|bfVar#8| |key_val|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |key_val| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |key| (CAR |key_val|))
             (SETQ |val| (CDR |key_val|))
             (SETQ |posv|
                     (COND ((OR (NULL |val|) (EQUAL |val| T)) |val|)
                           (#1# (|print_db_item| |stream| |val|))))
             (SETQ |master| (CONS (LIST |key| |posv|) |master|)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       (NREVERSE (H_KEY_VALS |$has_category_hash|)) NIL)
      (|print_db_item| |stream| |master|)))))

; write_categorydb() ==
;     write_daase_file('"category", function store_category_data)

(DEFUN |write_categorydb| ()
  (PROG () (RETURN (|write_daase_file| "category" #'|store_category_data|))))

; store_operation_data(stream) ==
;     for key_val in nreverse(H_KEY_VALS($operation_hash)) repeat
;         key := first(key_val)
;         val := rest(key_val)
;         pos := print_db_item(stream, val)
;         master := [[key, :pos], :master]
;     print_db_item(stream, master)

(DEFUN |store_operation_data| (|stream|)
  (PROG (|key| |val| |pos| |master|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#9| |key_val|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |key_val| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |key| (CAR |key_val|))
             (SETQ |val| (CDR |key_val|))
             (SETQ |pos| (|print_db_item| |stream| |val|))
             (SETQ |master| (CONS (CONS |key| |pos|) |master|)))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       (NREVERSE (H_KEY_VALS |$operation_hash|)) NIL)
      (|print_db_item| |stream| |master|)))))

; write_operationdb() ==
;     write_daase_file('"operation", function store_operation_data)

(DEFUN |write_operationdb| ()
  (PROG () (RETURN (|write_daase_file| "operation" #'|store_operation_data|))))

; true_name(p) == NAMESTRING(TRUENAME(p))

(DEFUN |true_name| (|p|) (PROG () (RETURN (NAMESTRING (TRUENAME |p|)))))

; check_for_ext(fn, ext) ==
;     fricas_probe_file(STRCONC(fn, ext))

(DEFUN |check_for_ext| (|fn| |ext|)
  (PROG () (RETURN (|fricas_probe_file| (STRCONC |fn| |ext|)))))

; merge_info_from_objects(files, options, make_database?) ==
;     dir := nil
;     only := []
;     expose := true
;     noquiet := true
;
;     for opt in options repeat
;         op1 := first(opt)
;         op1 = 'only =>
;            only := rest opt
;         op1 = 'dir =>
;             dir := first(rest(opt))
;             if NULL(dir) then
;                 sayKeyedMsg('S2IU0002, nil)
;         op1 = 'noexpose =>
;             expose := false
;         op1 = 'quiet =>
;             noquiet := false
;         FORMAT(true, '"   Ignoring unknown )library option: ~a~%", opt)
;
;     -- FIXME: make this _really_ portable
;     thisdir := true_name('"./")
;     if make_database? then
;         expose := false
;
;     nrlibs := []
;     asys := []
;     asos := []
;     if dir then
;         CHDIR(STRING(dir))
;         nrlibs := DIRECTORY('"*.NRLIB/index.KAF")
;         asys := DIRECTORY('"*.asy")
;         skipasos := MAPCAN(function PATHNAME_-NAME, asys)
;         -- asos := DIRECTORY('"*.ao)
;         CHDIR(thisdir)
;
;     nr_ext := STRCONC('".NRLIB/", $index_filename)
;     for file in files repeat
;         fname := STRING(file)
;         (nf := check_for_ext(fname, nr_ext)) =>
;             nrlibs := [nf, :nrlibs]
;         (nf := check_for_ext(fname, '".asy")) =>
;             asys := [nf, :asys]
;         (nf := check_for_ext(fname, '".ao")) =>
;             asos := [nf, :asos]
;         FORMAT(true, '"   )library cannot find the file ~a.~%", fname)
;
;     for fname in nreverse(nrlibs) repeat
;         key := PATHNAME_-NAME(last(PATHNAME_-DIRECTORY(fname)))
;         object := STRCONC(DIRECTORY_-NAMESTRING(fname), key)
;         merge_info_from_nrlib(key, fname, object, make_database?, expose,
;                               noquiet)
;     for fname in nreverse(asys) repeat
;         object := STRCONC(DIRECTORY_-NAMESTRING(fname), PATHNAME_-NAME(fname))
;         merge_info_from_asy(astran(fname), object, only, make_database?,
;                             expose, noquiet)
;     for fname in nreverse(asos) repeat
;         object := STRCONC(DIRECTORY_-NAMESTRING(fname), PATHNAME_-NAME(fname))
;         ASHARP(fname)
;         file := astran(STRCONC(PATHNAME_-NAME(fname), ".asy"))
;         merge_info_from_asy(file, object, only, make-database?, expose,
;                             noquiet)
;     clearConstructorCaches()

(DEFUN |merge_info_from_objects| (|files| |options| |make_database?|)
  (PROG (|dir| |only| |expose| |noquiet| |op1| |thisdir| |nrlibs| |asys| |asos|
         |skipasos| |nr_ext| |fname| |nf| |key| |object| |file|)
    (RETURN
     (PROGN
      (SETQ |dir| NIL)
      (SETQ |only| NIL)
      (SETQ |expose| T)
      (SETQ |noquiet| T)
      ((LAMBDA (|bfVar#10| |opt|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#10|) (PROGN (SETQ |opt| (CAR |bfVar#10|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |op1| (CAR |opt|))
             (COND ((EQ |op1| '|only|) (SETQ |only| (CDR |opt|)))
                   ((EQ |op1| '|dir|)
                    (PROGN
                     (SETQ |dir| (CAR (CDR |opt|)))
                     (COND ((NULL |dir|) (|sayKeyedMsg| 'S2IU0002 NIL)))))
                   ((EQ |op1| '|noexpose|) (SETQ |expose| NIL))
                   ((EQ |op1| '|quiet|) (SETQ |noquiet| NIL))
                   (#1#
                    (FORMAT T "   Ignoring unknown )library option: ~a~%"
                            |opt|))))))
          (SETQ |bfVar#10| (CDR |bfVar#10|))))
       |options| NIL)
      (SETQ |thisdir| (|true_name| "./"))
      (COND (|make_database?| (SETQ |expose| NIL)))
      (SETQ |nrlibs| NIL)
      (SETQ |asys| NIL)
      (SETQ |asos| NIL)
      (COND
       (|dir| (CHDIR (STRING |dir|))
        (SETQ |nrlibs| (DIRECTORY "*.NRLIB/index.KAF"))
        (SETQ |asys| (DIRECTORY "*.asy"))
        (SETQ |skipasos| (MAPCAN #'PATHNAME-NAME |asys|)) (CHDIR |thisdir|)))
      (SETQ |nr_ext| (STRCONC ".NRLIB/" |$index_filename|))
      ((LAMBDA (|bfVar#11| |file|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#11|) (PROGN (SETQ |file| (CAR |bfVar#11|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |fname| (STRING |file|))
             (COND
              ((SETQ |nf| (|check_for_ext| |fname| |nr_ext|))
               (SETQ |nrlibs| (CONS |nf| |nrlibs|)))
              ((SETQ |nf| (|check_for_ext| |fname| ".asy"))
               (SETQ |asys| (CONS |nf| |asys|)))
              ((SETQ |nf| (|check_for_ext| |fname| ".ao"))
               (SETQ |asos| (CONS |nf| |asos|)))
              (#1#
               (FORMAT T "   )library cannot find the file ~a.~%" |fname|))))))
          (SETQ |bfVar#11| (CDR |bfVar#11|))))
       |files| NIL)
      ((LAMBDA (|bfVar#12| |fname|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#12|) (PROGN (SETQ |fname| (CAR |bfVar#12|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |key| (PATHNAME-NAME (|last| (PATHNAME-DIRECTORY |fname|))))
             (SETQ |object| (STRCONC (DIRECTORY-NAMESTRING |fname|) |key|))
             (|merge_info_from_nrlib| |key| |fname| |object| |make_database?|
              |expose| |noquiet|))))
          (SETQ |bfVar#12| (CDR |bfVar#12|))))
       (NREVERSE |nrlibs|) NIL)
      ((LAMBDA (|bfVar#13| |fname|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#13|) (PROGN (SETQ |fname| (CAR |bfVar#13|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |object|
                     (STRCONC (DIRECTORY-NAMESTRING |fname|)
                      (PATHNAME-NAME |fname|)))
             (|merge_info_from_asy| (|astran| |fname|) |object| |only|
              |make_database?| |expose| |noquiet|))))
          (SETQ |bfVar#13| (CDR |bfVar#13|))))
       (NREVERSE |asys|) NIL)
      ((LAMBDA (|bfVar#14| |fname|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#14|) (PROGN (SETQ |fname| (CAR |bfVar#14|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |object|
                     (STRCONC (DIRECTORY-NAMESTRING |fname|)
                      (PATHNAME-NAME |fname|)))
             (ASHARP |fname|)
             (SETQ |file| (|astran| (STRCONC (PATHNAME-NAME |fname|) '|.asy|)))
             (|merge_info_from_asy| |file| |object| |only|
              (- |make| |database?|) |expose| |noquiet|))))
          (SETQ |bfVar#14| (CDR |bfVar#14|))))
       (NREVERSE |asos|) NIL)
      (|clearConstructorCaches|)))))

; make_databases(dir_lst, br_data) ==
;     clean_symbols2()
;     $has_category_hash := MAKE_HASHTABLE('EQUAL)
;     $operation_hash := MAKE_HASHTABLE('EQL)
;     $all_constructors := []
;     $all_operations := []
;     make_special_constructors()
;     merge_info_from_objects([], [['dir, true_name('"./")]], true)
;     for dir in dir_lst repeat
;         merge_info_from_objects([], [['dir, true_name(
;                                       STRCONC('"./~a", dir))]], true)
;     if br_data then
;         save_browser_data()
;         write_browsedb()
;     write_operationdb()
;     write_categorydb()
;     for con in allConstructors() repeat
;         finish_con_dbstruct(con)
;     write_interpdb()
;     createInitializers()
;     move_database('"interp", true)
;     move_database('"operation", true)
;     move_database('"browse", br_data)
;     move_database('"category", true)

(DEFUN |make_databases| (|dir_lst| |br_data|)
  (PROG ()
    (RETURN
     (PROGN
      (|clean_symbols2|)
      (SETQ |$has_category_hash| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$operation_hash| (MAKE_HASHTABLE 'EQL))
      (SETQ |$all_constructors| NIL)
      (SETQ |$all_operations| NIL)
      (|make_special_constructors|)
      (|merge_info_from_objects| NIL (LIST (LIST '|dir| (|true_name| "./"))) T)
      ((LAMBDA (|bfVar#15| |dir|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#15|) (PROGN (SETQ |dir| (CAR |bfVar#15|)) NIL))
            (RETURN NIL))
           (#1='T
            (|merge_info_from_objects| NIL
             (LIST (LIST '|dir| (|true_name| (STRCONC "./~a" |dir|)))) T)))
          (SETQ |bfVar#15| (CDR |bfVar#15|))))
       |dir_lst| NIL)
      (COND (|br_data| (|save_browser_data|) (|write_browsedb|)))
      (|write_operationdb|)
      (|write_categorydb|)
      ((LAMBDA (|bfVar#16| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#16|) (PROGN (SETQ |con| (CAR |bfVar#16|)) NIL))
            (RETURN NIL))
           (#1# (|finish_con_dbstruct| |con|)))
          (SETQ |bfVar#16| (CDR |bfVar#16|))))
       (|allConstructors|) NIL)
      (|write_interpdb|)
      (|createInitializers|)
      (|move_database| "interp" T)
      (|move_database| "operation" T)
      (|move_database| "browse" |br_data|)
      (|move_database| "category" T)))))

; add_operations(con, old_maps) ==
;     for map in old_maps repeat
;         op := first(map)
;         old_map := get_database(op, 'OPERATION)
;         old_map := NREMOVE(old_map, rest(map))
;         HPUT($operation_hash, op, old_map)
;     for map in get_database(con, 'MODEMAPS) repeat
;         op := first(map)
;         old_map := get_database(op, 'OPERATION)
;         HPUT($operation_hash, op, [rest(map), :old_map])

(DEFUN |add_operations| (|con| |old_maps|)
  (PROG (|op| |old_map|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#17| |map|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#17|) (PROGN (SETQ |map| (CAR |bfVar#17|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |op| (CAR |map|))
             (SETQ |old_map| (|get_database| |op| 'OPERATION))
             (SETQ |old_map| (NREMOVE |old_map| (CDR |map|)))
             (HPUT |$operation_hash| |op| |old_map|))))
          (SETQ |bfVar#17| (CDR |bfVar#17|))))
       |old_maps| NIL)
      ((LAMBDA (|bfVar#18| |map|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#18|) (PROGN (SETQ |map| (CAR |bfVar#18|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |op| (CAR |map|))
             (SETQ |old_map| (|get_database| |op| 'OPERATION))
             (HPUT |$operation_hash| |op| (CONS (CDR |map|) |old_map|)))))
          (SETQ |bfVar#18| (CDR |bfVar#18|))))
       (|get_database| |con| 'MODEMAPS) NIL)))))

; merge_info_from_asy(asy, object, only, make_database?, expose,
;                     noquiet) ==
;     SET_-FILE_-GETTER(object)
;     for domain in asy repeat
;         key := first(domain)
;         alist := rest(domain)
;         asharp_name := asharp_global_name(PATHNAME_-NAME(object), key,
;                                           LASSOC('typeCode, alist))
;         #alist < 4 =>
;             -- handle toplevel function object
;             opname := key
;             modemap := CAR(LASSOC('modemaps, alist))
;             oldmaps := get_database(opname, 'OPERATION)
;             HPUT($operation_hash, opname, adjoin_equal(
;                 SUBST(asharp_name, opname, CDR(modemap)), oldmaps))
;             set_asharp_autoload_function(object, asharp_name)
;         if (null(only) => key ~= '%%; MEMBER(key, only)) then
;             $all_operations := []       -- force this to recompute
;             oldmaps := get_database(key, 'MODEMAPS)
;             dbstruct := make_dbstruct()
;             PUT(key, 'DATABASE, dbstruct)
;             $all_constructors := ADJOIN(key, $all_constructors)
;             abbrev := fetch_data_from_alist(alist, '"abbreviation") or key
;             kind := set_dbstruct(dbstruct, FUNCTION(fetch_data_from_alist),
;                       alist, false,
;                         fetch_data_from_alist(alist, '"constructorForm"),
;                           abbrev, CONS(object, asharp_name))
;             PUT(abbrev, 'ABBREVIATIONFOR, key)
;             add_operations(key, oldmaps)
;             cname := opOf(dbstruct.$constructorform_ind)
;             if expose then setExposeAddConstr2([cname], noquiet)
;             if not(make_database?) then
;                 installConstructor(cname)
;                 updateDatabase(cname)
;                 -- following can break category database build
;                 if kind = 'category then
;                     dbstruct.$ancestors_ind :=
;                          fetch_data_from_alist(alist, '"ancestors")
;                 if kind = 'domain then
;                     for pair in fetch_data_from_alist(alist, '"ancestors")
;                       repeat
;                         HPUT($has_category_hash, CONS(cname, CAAR(pair)),
;                              CDR(pair))
;                 if $InteractiveMode then $CategoryFrame := $EmptyEnvironment
;             if kind = 'category then
;                 set_asharp_autoload_category(object, cname, asharp_name,
;                                              dbstruct.$cosig_ind)
;             else
;                 set_asharp_autoload_functor(object, cname, asharp_name,
;                                             dbstruct.$cosig_ind)
;             if noquiet then
;                 sayKeyedMsg('S2IU0001i, [cname, object])

(DEFUN |merge_info_from_asy|
       (|asy| |object| |only| |make_database?| |expose| |noquiet|)
  (PROG (|key| |alist| |asharp_name| |opname| |modemap| |oldmaps| |dbstruct|
         |abbrev| |kind| |cname|)
    (RETURN
     (PROGN
      (SET-FILE-GETTER |object|)
      ((LAMBDA (|bfVar#19| |domain|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#19|) (PROGN (SETQ |domain| (CAR |bfVar#19|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |key| (CAR |domain|))
             (SETQ |alist| (CDR |domain|))
             (SETQ |asharp_name|
                     (|asharp_global_name| (PATHNAME-NAME |object|) |key|
                      (LASSOC '|typeCode| |alist|)))
             (COND
              ((< (LENGTH |alist|) 4)
               (PROGN
                (SETQ |opname| |key|)
                (SETQ |modemap| (CAR (LASSOC '|modemaps| |alist|)))
                (SETQ |oldmaps| (|get_database| |opname| 'OPERATION))
                (HPUT |$operation_hash| |opname|
                      (|adjoin_equal|
                       (SUBST |asharp_name| |opname| (CDR |modemap|))
                       |oldmaps|))
                (|set_asharp_autoload_function| |object| |asharp_name|)))
              (#1#
               (COND
                ((COND ((NULL |only|) (NOT (EQ |key| '%%)))
                       (#1# (MEMBER |key| |only|)))
                 (SETQ |$all_operations| NIL)
                 (SETQ |oldmaps| (|get_database| |key| 'MODEMAPS))
                 (SETQ |dbstruct| (|make_dbstruct|))
                 (PUT |key| 'DATABASE |dbstruct|)
                 (SETQ |$all_constructors| (ADJOIN |key| |$all_constructors|))
                 (SETQ |abbrev|
                         (OR (|fetch_data_from_alist| |alist| "abbreviation")
                             |key|))
                 (SETQ |kind|
                         (|set_dbstruct| |dbstruct| #'|fetch_data_from_alist|
                          |alist| NIL
                          (|fetch_data_from_alist| |alist| "constructorForm")
                          |abbrev| (CONS |object| |asharp_name|)))
                 (PUT |abbrev| 'ABBREVIATIONFOR |key|)
                 (|add_operations| |key| |oldmaps|)
                 (SETQ |cname|
                         (|opOf| (ELT |dbstruct| |$constructorform_ind|)))
                 (COND
                  (|expose| (|setExposeAddConstr2| (LIST |cname|) |noquiet|)))
                 (COND
                  ((NULL |make_database?|) (|installConstructor| |cname|)
                   (|updateDatabase| |cname|)
                   (COND
                    ((EQ |kind| '|category|)
                     (SETF (ELT |dbstruct| |$ancestors_ind|)
                             (|fetch_data_from_alist| |alist| "ancestors"))))
                   (COND
                    ((EQ |kind| '|domain|)
                     ((LAMBDA (|bfVar#20| |pair|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#20|)
                               (PROGN (SETQ |pair| (CAR |bfVar#20|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (HPUT |$has_category_hash|
                                 (CONS |cname| (CAAR |pair|)) (CDR |pair|))))
                         (SETQ |bfVar#20| (CDR |bfVar#20|))))
                      (|fetch_data_from_alist| |alist| "ancestors") NIL)))
                   (COND
                    (|$InteractiveMode|
                     (SETQ |$CategoryFrame| |$EmptyEnvironment|)))))
                 (COND
                  ((EQ |kind| '|category|)
                   (|set_asharp_autoload_category| |object| |cname|
                    |asharp_name| (ELT |dbstruct| |$cosig_ind|)))
                  (#1#
                   (|set_asharp_autoload_functor| |object| |cname|
                    |asharp_name| (ELT |dbstruct| |$cosig_ind|))))
                 (COND
                  (|noquiet|
                   (|sayKeyedMsg| '|S2IU0001i|
                    (LIST |cname| |object|)))))))))))
          (SETQ |bfVar#19| (CDR |bfVar#19|))))
       |asy| NIL)))))

; merge_info_from_nrlib1(in_f, key, object, make_database?, expose,
;                        noquiet) ==
;     FILE_-POSITION(in_f, READ(in_f))
;     alist := READ(in_f)
;     -- (setq pos (third (assoc "constructorForm" alist :test #'string=)))
;     pos := first(fetch_data_from_alist(alist, '"constructorForm"))
;     FILE_-POSITION(in_f, pos)
;     constructorform := READ(in_f)
;     key := first(constructorform)
;     oldmaps := get_database(key, 'MODEMAPS)
;     dbstruct := make_dbstruct()
;     PUT(key, 'DATABASE, dbstruct)
;     $all_constructors := ADJOIN(key, $all_constructors)
;     abbrev := INTERN(PATHNAME_-NAME(last(PATHNAME_-DIRECTORY(object))))
;     ds := [alist, in_f]
;     kind :=
;         set_dbstruct(dbstruct, FUNCTION(fetch_data_from_file), ds,
;                      make_database?, constructorform, abbrev, object)
;     $all_operations := []  -- force this to recompute
;     PUT(abbrev, 'ABBREVIATIONFOR, key)
;     add_operations(key, oldmaps)
;     if not(make_database?) then
;         installConstructor(key)
;         if kind = 'category then
;             dbstruct.$ancestors_ind :=
;                  SUBLISLIS($FormalMapVariableList, rest(constructorform),
;                            fetch_data_from_file(ds, '"ancestors"))
;         updateDatabase(key)
;         updateCategoryTable(key, kind)
;         if $InteractiveMode  then $CategoryFrame := $EmptyEnvironment
;     REMPROP(key, 'LOADED)
;     if expose then setExposeAddConstr2([key], noquiet)
;     spad_set_autoload(key)
;     if noquiet then
;         sayKeyedMsg('S2IU0001, [key, object])

(DEFUN |merge_info_from_nrlib1|
       (|in_f| |key| |object| |make_database?| |expose| |noquiet|)
  (PROG (|alist| |pos| |constructorform| |oldmaps| |dbstruct| |abbrev| |ds|
         |kind|)
    (RETURN
     (PROGN
      (FILE-POSITION |in_f| (READ |in_f|))
      (SETQ |alist| (READ |in_f|))
      (SETQ |pos| (CAR (|fetch_data_from_alist| |alist| "constructorForm")))
      (FILE-POSITION |in_f| |pos|)
      (SETQ |constructorform| (READ |in_f|))
      (SETQ |key| (CAR |constructorform|))
      (SETQ |oldmaps| (|get_database| |key| 'MODEMAPS))
      (SETQ |dbstruct| (|make_dbstruct|))
      (PUT |key| 'DATABASE |dbstruct|)
      (SETQ |$all_constructors| (ADJOIN |key| |$all_constructors|))
      (SETQ |abbrev|
              (INTERN (PATHNAME-NAME (|last| (PATHNAME-DIRECTORY |object|)))))
      (SETQ |ds| (LIST |alist| |in_f|))
      (SETQ |kind|
              (|set_dbstruct| |dbstruct| #'|fetch_data_from_file| |ds|
               |make_database?| |constructorform| |abbrev| |object|))
      (SETQ |$all_operations| NIL)
      (PUT |abbrev| 'ABBREVIATIONFOR |key|)
      (|add_operations| |key| |oldmaps|)
      (COND
       ((NULL |make_database?|) (|installConstructor| |key|)
        (COND
         ((EQ |kind| '|category|)
          (SETF (ELT |dbstruct| |$ancestors_ind|)
                  (SUBLISLIS |$FormalMapVariableList| (CDR |constructorform|)
                   (|fetch_data_from_file| |ds| "ancestors")))))
        (|updateDatabase| |key|) (|updateCategoryTable| |key| |kind|)
        (COND
         (|$InteractiveMode| (SETQ |$CategoryFrame| |$EmptyEnvironment|)))))
      (REMPROP |key| 'LOADED)
      (COND (|expose| (|setExposeAddConstr2| (LIST |key|) |noquiet|)))
      (|spad_set_autoload| |key|)
      (COND (|noquiet| (|sayKeyedMsg| 'S2IU0001 (LIST |key| |object|))))))))

; merge_info_from_nrlib(key, nrlib, object, make_database?, expose,
;                       noquiet) ==
;     handle_input_file(nrlib, FUNCTION(merge_info_from_nrlib1),
;                       [key, object, make_database?, expose, noquiet])

(DEFUN |merge_info_from_nrlib|
       (|key| |nrlib| |object| |make_database?| |expose| |noquiet|)
  (PROG ()
    (RETURN
     (|handle_input_file| |nrlib| #'|merge_info_from_nrlib1|
                          (LIST |key| |object| |make_database?| |expose|
                                |noquiet|)))))
