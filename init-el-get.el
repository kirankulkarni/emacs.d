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

(add-to-list 'el-get-recipe-path el-get-my-recipes)


(defvar el-get-my-packages (append
                            (when (eq system-type 'darwin)
                              '(exec-path-from-shell))
                            '(cl-lib
                              dash
                              s
                              color-theme-pack
                              color-theme-obsidian
                              color-theme-zenburn
                              company-mode
                              ibuffer-vc
                              avy
                              ;; Ensure that texinfo is installed in the system
                              ;; I followed https://stuff-things.net/2018/01/30/building-emacs-25-on-macos-high-sierra/
                              ;; to ensure that makeinfo is updated.
                              ;; It still gave me error and then I installed manually using el-get-install function
                              swiper
                              magit
                              clojure-mode
                              cider
                              flymake
                              flymake-cursor
                              elpy
                              js2-mode
                              markdown-mode
                              paredit
                              pig-mode
                              yaml-mode
                              yasnippet)))


(el-get 'sync el-get-my-packages)

(provide 'init-el-get)
