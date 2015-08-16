
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


(defun icl/clojure-underscores-for-hyphens (namespace)
  "Replace all hyphens in NAMESPACE with underscores."
  (replace-regexp-in-string "-" "_" namespace))


(defun icl/midje-test-for (namespace)
  (let* ((namespace (icl/clojure-underscores-for-hyphens namespace))
         (segments (split-string namespace "\\."))
         (test-segments (append (list "test") segments)))
    (mapconcat 'identity test-segments "/")))


(defun icl/midje-jump-to-test ()
  "Jump from implementation file to test."
  (interactive)
  (find-file (format "%s/%s_test.clj"
                     (file-name-as-directory
                      (locate-dominating-file buffer-file-name "src/"))
                     (icl/midje-test-for (clojure-find-ns)))))


(defun icl/midje-implementation-for (namespace)
  (let* ((namespace (icl/clojure-underscores-for-hyphens namespace))
         (segments (split-string (replace-regexp-in-string "_test"
                                                           ""
                                                           namespace)
                                 "\\.")))
    (mapconcat 'identity segments "/")))


(defun icl/midje-jump-to-implementation ()
  "Jump from midje test file to implementation."
  (interactive)
  (find-file (format "%s/src/%s.clj"
                     (locate-dominating-file buffer-file-name "src/")
                     (icl/midje-implementation-for (clojure-find-ns)))))


(defun icl/clojure-in-tests-p ()
  "Check whether the current file is a test file.
  Two checks are made - whether the namespace of the file has the
  word test in it and whether the file lives under the test/
  directory."
  (or (string-match-p "test\." (clojure-find-ns))
      (string-match-p "/test" (buffer-file-name))))


(defun icl/midje-jump-between-tests-and-code ()
  (interactive)
  (if (icl/clojure-in-tests-p)
      (icl/midje-jump-to-implementation)
    (icl/midje-jump-to-test)))





(eval-after-load 'clojure-mode
  '(progn
     (setq cider-prompt-for-symbol nil
           cider-mode-line nil
           cider-annotate-completion-candidates t
           cider-completion-annotations-include-ns 'always
           cider-show-error-buffer 'except-in-repl)
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
       'icl/midje-jump-between-tests-and-code)))


(provide 'init-clojure-mode)
