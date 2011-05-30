;; Flymake Config
(when (load "flymake" t) 
  (defun flymake-pyflakes-init () 
     ; Make sure it's not a remote buffer or flymake would not work
     (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                         'flymake-create-temp-inplace)) 
             (local-file (file-relative-name 
                          temp-file 
                          (file-name-directory buffer-file-name))))
	(list "pycheckers" (list local-file)))) 
  (add-to-list 'flymake-allowed-file-name-masks 
               '("\\.py\\'" flymake-pyflakes-init)))

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name temp-file
		(file-name-directory buffer-file-name))))
    (list "erlchecker" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

;; From Vedang
(load-library "flymake-cursor")
(global-set-key [f2] 'flymake-goto-prev-error)
(global-set-key [f3] 'flymake-goto-next-error)

;; End of config
(provide 'flymake-config)
 
