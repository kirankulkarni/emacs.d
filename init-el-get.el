(setq el-get-dirname (concat dotfiles-dir "el-get/")
      el-get-user-package-directory (concat dotfiles-dir
                                            "packages/")
      el-get-my-recipes (concat dotfiles-dir
                                 "packages/my-recipes/"))

(add-to-list 'load-path (concat el-get-dirname "el-get"))

;;; If not already downloaded download el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))



(defvar el-get-my-packages (append
                            '(ac-nrepl
                              auto-complete
                              cider
                              cl-lib
                              clojure-mode
                              dash
                              elpy
                              flymake
                              flymake-cursor
                              js2-mode
                              magit
                              markdown-mode
                              paredit
                              s
                              yasnippet)
                            (mapcar 'el-get-source-name el-get-sources)))


(el-get 'sync el-get-my-packages)

(provide 'init-el-get)
