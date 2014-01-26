;; Create a symbol list from a string
(defun symbols-from-string (string)
  (let ((input-stream (make-string-input-stream string)))
    (loop for input = (read input-stream nil nil)
	  while input
	  collect input)))

;;; GAME REPL

;; Read user input into a symbol list
(defun game-repl-read (&optional (STREAM *standard-input*))
  (symbols-from-string (read-line STREAM)))

;; Evaluate user commands into game actions
(defun game-repl-eval (command)
  (case (first command)
    ('quit :done)
    (t command)))

;; Print game output
(defun game-repl-print (output)
  (format t "~a~%" output))

;; Loop over user input as necessary
(defun game-repl ()
  (let* ((command (game-repl-read))
	 (result  (game-repl-eval command)))
    (unless (eq :done result)
      (game-repl-print result)
      (game-repl))))

(game-repl)
