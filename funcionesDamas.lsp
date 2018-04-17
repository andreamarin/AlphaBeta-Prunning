;; Los estados son de la forma ((0 . x) (1 . x) (2 . x) ... (31 . x))
;; nodos son de la forma (ID IDPAPA state move bestValue  depth)
;; 1 - Ficha Roja, 3 - Rey Rojo, 0 - Vacio, -1 - Ficha Negra, -3 - Rey Negro
;; Rojos primero
;; State inicial : 

;(setq st0 '(( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1) ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1) (12 .  0) (13 .  0) (14 .  0) (15 .  0) (16 .  0) (17 .  0) (18 .  0) (19 .  0) (20 . -1) (21 . -1) (22 . -1) (23 . -1) (24 . -1) (25 . -1) (26 . -1) (27 . -1) (28 . -1) (29 . -1) (30 . -1) (31 . -1) ))

;;                  ( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) 
;;                ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1)
;;                  ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1)
;;                (12 .  0) (13 .  0) (14 .  0) (15 .  0)
;;                  (16 .  0) (17 .  0) (18 .  0) (19 .  0)
;;                (20 . -1) (21 . -1) (22 . -1) (23 . -1)
;;                  (24 . -1) (25 . -1) (26 . -1) (27 . -1)
;;                (28 . -1) (29 . -1) (30 . -1) (31 . -1)
;;Otros Tableros:
;;(setq st1 '(( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1) ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1) (12 .  0) (13 .  -1) (14 .  0) (15 .  0) (16 .  0) (17 .  0) (18 .  0) (19 .  0) (20 . -1) (21 . 0) (22 . -1) (23 . -1) (24 . -1) (25 . -1) (26 . -1) (27 . -1) (28 . -1) (29 . -1) (30 . -1) (31 . -1) ))
;;                  ( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) 
;;                ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1)
;;                  ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1)
;;                (12 .  0) (13 . -1) (14 .  0) (15 .  0)
;;                  (16 .  0) (17 .  0) (18 .  0) (19 .  0)
;;                (20 . -1) (21 . 0) (22 . -1) (23 . -1)
;;                  (24 . -1) (25 . -1) (26 . -1) (27 . -1)
;;                (28 . -1) (29 . -1) (30 . -1) (31 . -1)
;;(setq st2 '(( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1) ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1) (12 .  0) (13 .  -1) (14 .  0) (15 .  0) (16 .  0) (17 .  0) (18 .  0) (19 .  0) (20 . -1) (21 . -1) (22 . -1) (23 . -1) (24 . 0) (25 . -1) (26 . 0) (27 . -1) (28 . -1) (29 . -1) (30 . -1) (31 . -1) ))
;;                  ( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) 
;;                ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1)
;;                  ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1)
;;                (12 .  0) (13 . -1) (14 .  0) (15 .  0)
;;                  (16 .  0) (17 .  0) (18 .  0) (19 .  0)
;;                (20 . -1) (21 . -1) (22 . -1) (23 . -1)
;;                  (24 .  0) (25 . -1) (26 .  0) (27 . -1)
;;                (28 . -1) (29 . -1) (30 . -1) (31 . -1)
;;(setq st3 '(( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1) ( 8 .  1) ( 9 .  3) (10 .  1) (11 .  0) (12 .  0) (13 .  0) (14 .  -1) (15 .  -1) (16 .  0) (17 .  0) (18 .  0) (19 .  0) (20 . -1) (21 . -1) (22 . -1) (23 . -1) (24 . -1) (25 . 0) (26 . -1) (27 . -1) (28 . -1) (29 . -1) (30 . -1) (31 . -1) ))
;;                  ( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) 
;;                ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1)
;;                  ( 8 .  1) ( 9 .  3) (10 .  1) (11 .  0)
;;                (12 .  0) (13 .  0) (14 . -1) (15 . -1)
;;                  (16 .  0) (17 .  0) (18 .  0) (19 .  0)
;;                (20 . -1) (21 . -1) (22 . -1) (23 . -1)
;;                  (24 . -1) (25 .  0) (26 . -1) (27 . -1)
;;                (28 . -1) (29 . -1) (30 . -1) (31 . -1)
;;(setq st4 '(( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1) ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1) (12 .  0) (13 .  0) (14 .  0) (15 .  0) (16 .  0) (17 .  0) (18 .  3) (19 .  0) (20 . -1) (21 . 0) (22 . -1) (23 . 0) (24 . -1) (25 . -1) (26 . -1) (27 . -1) (28 . -1) (29 . -1) (30 . -1) (31 . -1) ))
;;                  ( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) 
;;                ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1)
;;                  ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1)
;;                (12 .  0) (13 .  0) (14 .  0) (15 .  0)
;;                  (16 .  0) (17 .  0) (18 .  3) (19 .  0)
;;                (20 . -1) (21 . 0) (22 . -1) (23 . 0)
;;                  (24 . -1) (25 . -1) (26 . -1) (27 . -1)
;;                (28 . -1) (29 . -1) (30 . -1) (31 . -1)
;;(setq st5 '(( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1) ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1) (12 .  0) (13 .  0) (14 .  0) (15 .  0) (16 .  0) (17 .  0) (18 .  1) (19 .  0) (20 . -1) (21 . -1) (22 . -1) (23 . -1) (24 . -1) (25 . -1) (26 . -1) (27 . -1) (28 . -1) (29 . -1) (30 . -1) (31 . -1) ))
;;                  ( 0 .  1) ( 1 .  1) ( 2 .  1) ( 3 .  1) 
;;                ( 4 .  1) ( 5 .  1) ( 6 .  1) ( 7 .  1)
;;                  ( 8 .  1) ( 9 .  1) (10 .  1) (11 .  1)
;;                (12 .  0) (13 .  0) (14 .  0) (15 .  0)
;;                  (16 .  0) (17 .  0) (18 .  1) (19 .  0)
;;                (20 . -1) (21 . -1) (22 . -1) (23 . -1)
;;                  (24 . -1) (25 . -1) (26 . -1) (27 . -1)
;;                (28 . -1) (29 . -1) (30 . -1) (31 . -1)

;;Diagonales: Primero crecientes, luego decrecientes
(setq diagonals '(((28) (20 24 29) (12 16 21 25 30) (4 8 13 17 22 26 31) (0 5 9 14 18 23 27) (1 6 10 15 19) (2 7 11) (3)) ((0 4) (1 5 8 12) (2 6 9 13 16 20) (3 7 10 14 17 21 24 28) (11 15 18 22 25 29) (19 23 26 30) (27 31)) ))

;;Trabaja con currentState como var global
(defun getRedMoves(state)
    (setq currentState (copy-tree state))
    (let ( (redJumps nil) (redMoves nil) )
        (loop for draught in currentState do
            (cond
                ((= 1 (cdr draught)) 
                    (let (d (getAdj (car draught)))
                        (setq auxJumps (redJumpMan (car draught)))
                        
                        (if (< 1 (length (car auxJumps)))
                            (setq redJumps (append redJumps auxJumps))
                            nil
                        )
                        
                        (if (Null redJumps)
                            (setq redMoves (append redMoves (redMvMan (car draught))))
                            nil
                        )
                        
                    )
                )
                ((= 3 (cdr draught)) 
                    (let (d (getAdj (car draught)))
                        (setq auxJumps (redJumpKing (car draught) nil))
                        
                        (if (< 1 (length (car auxJumps)))
                            (setq redJumps (append redJumps auxJumps))
                            nil
                        )
                        
                        (if (Null redJumps)
                            (setq redMoves (append redMoves (redMvKing (car draught))))
                            nil
                        )
                        
                    )
                )
                (t)
            )
        )
        (cond
            ((Null redJumps) redMoves)
            (t redJumps)
        )
    )
)


(defun findIn(n diags)
    (let ( (d (car diags)) (pos (position n (car diags))) )
        (cond
            ((Null pos)
                (findIn n (cdr diags))
            )
            (t
                (list (reverse (subseq d (max 0 (- pos 2)) pos)) (subseq d (incf pos) (min (length d) (+ pos 2))))
            )
        )
    )
)

(defun getAdj(n)
    (let ((d1 (findIn n (car diagonals))) (d2 (findIn n (cadr diagonals))))
        (list (car d1) (car d2) (cadr d1) (cadr d2))
    )
)

(defun checkSpace(n &optional (state currentState))
    (cdar (nthcdr n state))
)

;;funciones para obtener los movimientos posibles a partir de un estado.
(defun redJumpMan(n)
    (let ( (d (getAdj n)) (possible nil) )
        
        ;;Revisa movimiento 3
        (if (= 2(length (third d))) 
            (if (and (> 0 (checkSpace (car (third d)))) (= 0 (checkSpace (cadr (third d)))))
                (push (cadr (third d)) possible)
                nil
            )
            nil
        )
        
        
        ;;Revisa movimiento 4
        (if (= 2 (length (fourth d)))
            (if (and (> 0 (checkSpace (car (fourth d)))) (= 0 (checkSpace (cadr (fourth d)))))
                (push (cadr (fourth d)) possible)
                nil
            )
            nil
        )
        
        ;;Calcula jumps posibles
        (cond
            ((Null possible) (list (list n)))
            (t (mapcar (lambda (x) (cons n x)) (mapcan #'redJumpMan possible) ))
        )
    )
)

(defun redMvMan(n)
    (let ( (d (getAdj n)) (possible nil) )
        
        ;;Revisa movimiento 3
        (if (<= 1 (length (third d)))   
            (if (= 0 (checkSpace (car (third d))))
                (push (cons n (car (third d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 4
        (if (<= 1 (length (fourth d)))
            (if (= 0 (checkSpace (car (fourth d))))
                (push (cons n (car (fourth d))) possible)
                nil
            )
            nil
        )
        
        possible
    )
)

(defun redJumpKing(n banned)
    (let ( (d (getAdj n)) (possible nil) (bans nil))
        
        
        ;;Revisa movimiento 1
        (if (= 2 (length (first d)))
            (when (and (not (find (car (first d)) banned)) (> 0 (checkSpace (car (first d)))) (= 0 (checkSpace (cadr (first d)))))
                (push (cadr (first d)) possible)
                (push (cons (car (first d)) banned) bans)
            )
        )
        
        ;;Revisa movimiento 2
        (if (= 2 (length (second d)))
            (when (and (not (find (car (second d)) banned)) (> 0 (checkSpace (car (second d)))) (= 0 (checkSpace (cadr (second d)))))
                (push (cadr (second d)) possible)
                (push (cons (car (second d)) banned) bans)
            )
        )
        
        ;;Revisa movimiento 3
        (if (= 2 (length (third d)))
            (when (and (not (find (car (third d)) banned)) (> 0 (checkSpace (car (third d)))) (= 0 (checkSpace (cadr (third d)))))
                (push (cadr (third d)) possible)
                (push (cons (car (third d)) banned) bans)
            )
        )
        
        ;;Revisa movimiento 4
        (if (= 2 (length (fourth d)))
            (when (and (not (find (car (fourth d)) banned)) (> 0 (checkSpace (car (fourth d)))) (= 0 (checkSpace (cadr (fourth d)))))
                (push (cadr (fourth d)) possible)
                (push (cons (car (fourth d)) banned) bans)
            )
        )
        
        ;;Calcula jumps posibles
        (cond
            ((Null possible) (list (list n)))
            (t (mapcar (lambda (x) (cons n x)) (mapcan #'redJumpKing possible bans) ))
        )
    )
)

(defun redMvKing(n)
    (let ( (d (getAdj n)) (possible nil) )
        
        ;;Revisa movimiento 1
        (if (<= 1 (length (first d)))   
            (if (= 0 (checkSpace (car (first d))))
                (push (cons n (car (first d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 2
        (if (<= 1 (length (second d)))
            (if (= 0 (checkSpace (car (second d))))
                (push (cons n (car (second d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 3
        (if (<= 1 (length (third d)))   
            (if (= 0 (checkSpace (car (third d))))
                (push (cons n (car (third d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 4
        (if (<= 1 (length (fourth d)))
            (if (= 0 (checkSpace (car (fourth d))))
                (push (cons n (car (fourth d))) possible)
                nil
            )
            nil
        )
        ;;Calcula jumps posibles
        possible
    )
)


(defun blkJumpMan(n)
    (let ( (d (getAdj n)) (possible nil) )
        
        ;;Revisa movimiento 1
        (if (= 2(length (first d))) 
            (if (and (< 0 (checkSpace (car (first d)))) (= 0 (checkSpace (cadr (first d)))))
                (push (cadr (first d)) possible)
                nil
            )
            nil
        )
        
        
        ;;Revisa movimiento 2
        (if (= 2 (length (second d)))
            (if (and (< 0 (checkSpace (car (second d)))) (= 0 (checkSpace (cadr (second d)))))
                (push (cadr (second d)) possible)
                nil
            )
            nil
        )
        
        ;;Calcula jumps posibles
        (cond
            ((Null possible) (list (list n)))
            (t (mapcar (lambda (x) (cons n x)) (mapcan #'blkJumpMan possible) ))
        )
    )
)

(defun blkMvMan(n)
    (let ( (d (getAdj n)) (possible nil) )
        
        ;;Revisa movimiento 1
        (if (<= 1 (length (first d)))   
            (if (= 0 (checkSpace (car (first d))))
                (push (cons n (car (first d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 2
        (if (<= 1 (length (second d)))
            (if (= 0 (checkSpace (car (second d))))
                (push (cons n (car (second d))) possible)
                nil
            )
            nil
        )
        
        possible
    )
)

(defun blkJumpKing(n banned)
    (let ( (d (getAdj n)) (possible nil) (bans nil))
        
        
        ;;Revisa movimiento 1
        (if (= 2 (length (first d)))
            (when (and (not (find (car (first d)) banned)) (< 0 (checkSpace (car (first d)))) (= 0 (checkSpace (cadr (first d)))))
                (push (cadr (first d)) possible)
                (push (cons (car (first d)) banned) bans)
            )
        )
        
        ;;Revisa movimiento 2
        (if (= 2 (length (second d)))
            (when (and (not (find (car (second d)) banned)) (< 0 (checkSpace (car (second d)))) (= 0 (checkSpace (cadr (second d)))))
                (push (cadr (second d)) possible)
                (push (cons (car (second d)) banned) bans)
            )
        )
        
        ;;Revisa movimiento 3
        (if (= 2 (length (third d)))
            (when (and (not (find (car (third d)) banned)) (< 0 (checkSpace (car (third d)))) (= 0 (checkSpace (cadr (third d)))))
                (push (cadr (third d)) possible)
                (push (cons (car (third d)) banned) bans)
            )
        )
        
        ;;Revisa movimiento 4
        (if (= 2 (length (fourth d)))
            (when (and (not (find (car (fourth d)) banned)) (< 0 (checkSpace (car (fourth d)))) (= 0 (checkSpace (cadr (fourth d)))))
                (push (cadr (fourth d)) possible)
                (push (cons (car (fourth d)) banned) bans)
            )
        )
        
        ;;Calcula jumps posibles
        (cond
            ((Null possible) (list (list n)))
            (t (mapcar (lambda (x) (cons n x)) (mapcan #'blkJumpKing possible bans) ))
        )
    )
)

(defun blkMvKing(n)
    (let ( (d (getAdj n)) (possible nil) )
        
        ;;Revisa movimiento 1
        (if (<= 1 (length (first d)))
            (if (= 0 (checkSpace (car (first d))))
                (push (cons n (car (first d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 2
        (if (<= 1 (length (second d)))
            (if (= 0 (checkSpace (car (second d))))
                (push (cons n (car (second d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 3
        (if (<= 1 (length (third d)))   
            (if (= 0 (checkSpace (car (third d))))
                (push (cons n (car (third d))) possible)
                nil
            )
            nil
        )
        
        ;;Revisa movimiento 4
        (if (<= 1 (length (fourth d)))
            (if (= 0 (checkSpace (car (fourth d))))
                (push (cons n (car (fourth d))) possible)
                nil
            )
            nil
        )
        ;;Calcula jumps posibles
        possible
    )
)

;;Usa currentState como global
(defun getBlkMoves(state)
    (setq currentState (copy-tree state))
    (let ( (blkJumps nil) (blkMoves nil) )
        (loop for draught in currentState do
            (cond
                ((= -1 (cdr draught)) 
                    (let (d (getAdj (car draught)))
                        (setq auxJumps (blkJumpMan (car draught)))
                        
                        (if (< 1 (length (car auxJumps)))
                            (setq blkJumps (append blkJumps auxJumps))
                            nil
                        )
                        
                        (if (Null blkJumps)
                            (setq blkMoves (append blkMoves (blkMvMan (car draught))))
                            nil
                        )
                        
                    )
                )
                ((= -3 (cdr draught)) 
                    (let (d (getAdj (car draught)))
                        (setq auxJumps (blkJumpKing (car draught) nil))
                        
                        (if (< 1 (length (car auxJumps)))
                            (setq blkJumps (append blkJumps auxJumps))
                            nil
                        )
                        
                        (if (Null blkJumps)
                            (setq blkMoves (append blkMoves (blkMvKing (car draught))))
                            nil
                        )
                        
                    )
                )
                (t)
            )
        )
        (cond
            ((Null blkJumps) blkMoves)
            (t blkJumps)
        )
    )
)

(defun applyMove(state mv)
    
    (let ( (res (copy-tree state)) (start (car mv)) (rest (cdr mv)) )
        (cond
            ((listp rest)
                (let ( (mode (mod (floor start 4) 2)) (type (checkSpace start res)) ) 
                    (if (= 0 mode)
                        (setq mode 1)
                        (setq mode -1)
                    )
                    (setf (cdar (nthcdr start res)) 0)
                    
                    (loop for step in rest do
                        (setq mid (/ (+ start step mode) 2))
                        (setf (cdar (nthcdr mid res)) 0)
                        (setq  start step)
                    )
                    
                    ;;Start termina con el ultimo valor guardado
                    (setf (cdar (nthcdr start res)) type)
                    
                )
            )
            (t
                (setf (cdar (nthcdr rest res)) (checkSpace start res) (cdar (nthcdr start res)) 0)
            )
        )
        res
    ) 
)


;; minimax con alpha-beta prunning, recibe la profundidad máxima como parámetro y crea el nodo inicial
;; Los valores de alpha y beta iniciales son -1000 y 1000 pues el score del tablero va de -? a ?
;; Cuando alpha es mayor que beta entonces se hace prunning, es decir, ya no se expande ese nodo.
;;se trabaja con alpha, beta, bestMove y possibleMoves como variables globales 

(setq possibleMoves nil alpha -1000 beta 1000 id 0)

(defun minimax-ab (state max-depth asRed)
    (if asRed 
        (setq bm (maxMove (list id -1 state 0 nil max-depth) -1000 1000))
        (setq bm (minMove (list id -1 state 0 nil max-depth) -1000 1000))
    )
)

;; simula las decisiones del jugador (maximiza)
(defun maxMove (node alpha beta)
   (let ((bestMove nil)) 
  (cond 
   ((= (sixth node) 0) (setf (fifth node) (getScore (third node))))
   (t (setf (fifth node) -1000) (getMoves node t) (cond
						    ((= (length possibleMoves) 0) (setf (fifth node) (getScore (third node))))
						    (t (loop for x in possibleMoves do (when (< (fifth node) beta) (minMove x (fifth node) beta) (setf (fifth node) (max (fifth node) (fifth x))) (when (= (fifth node) (fifth x)) (setq bestMove x)))) bestMove ))
   ))
  )
)
      
;; simula las decisiones del oponente (minimiza)      
(defun minMove (node alpha beta)
  (let ((bestMove nil))
 (cond 
   ((= (sixth node) 0) (setf (fifth node) (getScore (third node))))
   (t (setf (fifth node) 1000) (getMoves node nil) (cond
						     ((= (length possibleMoves) 0) (setf (fifth node) (getScore (third node))))
						     (t (loop for x in possibleMoves do (when (> (fifth node) alpha) (maxMove x alpha (fifth node)) (setf (fifth node) (min (fifth node) (fifth x))) (when (= (fifth node) (fifth x)) (setq bestMove x)))) bestMove ))
   ))
 )
)

;; crea una lista con todos los "hijos" del nodo dado
;; trabaja con possibleMoves como variable global
(defun getMoves(node isMax)
  (setq possibleMoves '() moves (if isMax (getRedMoves (third node)) (getBlkMoves (third node))) states (mapcar #'(lambda (x) (applyMove (third node) x)) moves) nextStates (mapcar #'(lambda (x y) (list x y)) states moves)) 
  (loop for x in nextStates do (push (list (incf id) (car node) (car x) (second x) nil (- (sixth node) 1)) possibleMoves)
  )
  (setq possibleMoves (reverse possibleMoves))
)

(defun getScore(state)
    (cond
        ((= (count-if (lambda (x) (< 0 x)) (mapcar #'cdr state)) 0) 999)
        ((null (getblkmoves state)) 999)
        ((= (count-if (lambda (x) (> 0 x)) (mapcar #'cdr state)) 0) -999)
        ((null (getredmoves state)) -999)
        (t (apply #'+ (mapcar #'cdr state)))
    )
)

