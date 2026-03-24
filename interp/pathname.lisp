
; )package "BOOT"

(IN-PACKAGE "BOOT")

; pathname p ==
;   if SYMBOLP(p) then p := SYMBOL_-NAME(p)
;   PATHNAMEP p => p
;   not PAIRP p => PATHNAME p
;   error '"Strange argument to pathname"

(DEFUN |pathname| (|p|)
  (PROG ()
    (RETURN
     (PROGN
      (COND ((SYMBOLP |p|) (SETQ |p| (SYMBOL-NAME |p|))))
      (COND ((PATHNAMEP |p|) |p|) ((NULL (CONSP |p|)) (PATHNAME |p|))
            ('T (|error| "Strange argument to pathname")))))))

; namestring p == NAMESTRING pathname p

(DEFUN |namestring| (|p|) (PROG () (RETURN (NAMESTRING (|pathname| |p|)))))

; pathnameName p == PATHNAME_-NAME pathname p

(DEFUN |pathnameName| (|p|) (PROG () (RETURN (PATHNAME-NAME (|pathname| |p|)))))

; pathnameType p == PATHNAME_-TYPE pathname p

(DEFUN |pathnameType| (|p|) (PROG () (RETURN (PATHNAME-TYPE (|pathname| |p|)))))

; pathnameDirectory p ==
;     NAMESTRING MAKE_-PATHNAME(INTERN('"DIRECTORY", '"KEYWORD"),_
;                                PATHNAME_-DIRECTORY pathname p)

(DEFUN |pathnameDirectory| (|p|)
  (PROG ()
    (RETURN
     (NAMESTRING
      (MAKE-PATHNAME (INTERN "DIRECTORY" "KEYWORD")
                     (PATHNAME-DIRECTORY (|pathname| |p|)))))))

; deleteFile f == DELETE_-FILE f

(DEFUN |deleteFile| (|f|) (PROG () (RETURN (DELETE-FILE |f|))))

; isExistingFile f ==
;   if make_input_filename(f)
;     then
;       true
;     else false

(DEFUN |isExistingFile| (|f|)
  (PROG () (RETURN (COND ((|make_input_filename| |f|) T) ('T NIL)))))

; isSystemDirectory path ==
;   -- check if $spadroot is the prefix of 'path'
;   # path >= # $spadroot and EVERY(function CHAR_=, $spadroot, path)

(DEFUN |isSystemDirectory| (|path|)
  (PROG ()
    (RETURN
     (AND (NOT (< (LENGTH |path|) (LENGTH |$spadroot|)))
          (EVERY #'CHAR= |$spadroot| |path|)))))
