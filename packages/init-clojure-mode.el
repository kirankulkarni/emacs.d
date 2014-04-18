
(defun pretty-fns ()
  (font-lock-add-keywords
   nil `(("(\\(fn\\)[\[[:space:]]"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    "ƒ")
                    nil))))))


(defun pretty-reader-macros ()
  (font-lock-add-keywords
   nil `(("\\(#\\)("
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    "λ")
                    nil))))))


(defun pretty-sets ()
  (font-lock-add-keywords
   nil `(("\\(#\\){"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    "∈")
                    nil))))))


(defun midje-test-for (namespace)
  (let* ((namespace (clojure-underscores-for-hyphens namespace))
         (segments (split-string namespace "\\."))
         (test-segments (append (list "test") segments)))
    (mapconcat 'identity test-segments "/")))


(defun midje-jump-to-test ()
  "Jump from implementation file to test."
  (interactive)
  (find-file (format "%s/%s_test.clj"
                     (file-name-as-directory
                      (locate-dominating-file buffer-file-name "src/"))
                     (midje-test-for (clojure-find-ns)))))


(defun midje-implementation-for (namespace)
  (let* ((namespace (clojure-underscores-for-hyphens namespace))
         (segments (split-string (replace-regexp-in-string "_test" "" namespace) "\\.")))
    (mapconcat 'identity segments "/")))


(defun midje-jump-to-implementation ()
  "Jump from midje test file to implementation."
  (interactive)
  (find-file (format "%s/src/%s.clj"
                     (locate-dominating-file buffer-file-name "src/")
                     (midje-implementation-for (clojure-find-package)))))


(defun midje-jump-between-tests-and-code ()
  (interactive)
  (if (clojure-in-tests-p)
      (midje-jump-to-implementation)
    (midje-jump-to-test)))





(eval-after-load 'clojure-mode
  '(progn
     (put-clojure-indent 'describe 'defun)
     (put-clojure-indent 'testing 'defun)
     (put-clojure-indent 'given 'defun)
     (put-clojure-indent 'using 'defun)
     (put-clojure-indent 'with 'defun)
     (put-clojure-indent 'it 'defun)
     (put-clojure-indent 'do-t 'defun)
     (add-hook 'clojure-coding-hook 'pretty-fns)
     (add-hook 'clojure-coding-hook 'pretty-reader-macros)
     (add-hook 'clojure-coding-hook 'pretty-sets)
     (remove-hook 'clojure-mode-hook
                  'clojure-test-maybe-enable)
     (define-key clojure-mode-map (kbd "C-c t")
       'midje-jump-between-tests-and-code)))


(provide 'init-clojure-mode)
