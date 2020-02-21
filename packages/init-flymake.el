(defun flymake-pyflakes-init ()
                                        ; Make sure it's not a remote buffer or flymake would not work
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
	(list "pycheckers" (list local-file))))


(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name temp-file
		(file-name-directory buffer-file-name))))
    (list "erlchecker" (list local-file))))



;; Remove html from flymake list
(defun flymake-delete-unnecessary-modes (modes-to-disable)
   "Remove modes from flymake-allowed-file-name-masks to avoid flymake popup."
   (let* ((flymake-elts-to-delete))
     (dolist (elt flymake-allowed-file-name-masks)
       (dolist (disabled-mode modes-to-disable)
         (when (eq (string-match-p (car elt) (concat "." disabled-mode)) 0)
           (add-to-list 'flymake-elts-to-delete elt))))
     (dolist (elt flymake-elts-to-delete)
       (setq flymake-allowed-file-name-masks
             (delete elt flymake-allowed-file-name-masks)))))


(eval-after-load "flymake"
  '(progn
     (add-to-list 'flymake-allowed-file-name-masks
                  '("\\.erl\\'" flymake-erlang-init))
     (add-to-list 'flymake-allowed-file-name-masks
                  '("\\.py\\'" flymake-pyflakes-init))
     (flymake-delete-unnecessary-modes '("html" "xml" "java"))
     (require 'flymake-cursor)
     (global-set-key [f2] 'flymake-goto-prev-error)
     (global-set-key [f3] 'flymake-goto-next-error)))


(provide 'init-flymake)
