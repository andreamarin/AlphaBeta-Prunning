
(Load 'funcionesDamas.lsp)
;(setq in (open "data/in.txt"))
;(setq depth (read-from-string (read-line in)))
;(setq st (read-from-string (read-line in)))
;(close in)

(setq depth (parse-integer (car #+CLISP *args*)))
(setq st (read-from-string (cadr #+CLISP *args*)))
(setq asRed (read-from-string (caddr #+CLISP *args*)))

(minimax-ab st depth asRed)

(print "depth:")
(print depth)
(print "from:")
(print st)
(print "to:")
(print (caddr bm))
(print (fourth bm))

;(with-open-file (str "data/out.txt"
;                     :direction :output
;                     :if-exists :supersede
;                    :if-does-not-exist :create)
;  (format str (write-to-string (fourth bestMove))) )

