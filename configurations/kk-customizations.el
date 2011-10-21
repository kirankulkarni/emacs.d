;; My customizatoin file where I will load mode-specific customizations

;; Don't clutter up directories with files~
;; copied from Vedang
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))
;; Paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Use 'Y' or 'N' to answer Yes/No 
(defalias 'yes-or-no-p 'y-or-n-p)
;; ido mode configuration
(require 'ido-mode-config)

;; util functions
(require 'util-functions)

;; lisp-mode configuration
(require 'lisp-mode-config)

;; Keybindings
(require 'key-bindings)

;; org mode configuration
(require 'org-mode-config)

;; Magit configuration
(require 'magit-config)

;; Auto-Complete configuration
(require 'auto-complete-mode-config)

;; Python customizations
(require 'python-mode-config)

;; Flymake
(require 'flymake-config)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Uniquify configuration
(setq uniquify-buffer-name-style 'post-forward)

;; GO Mode config
(require 'go-mode-config)

;; Latex Mode
(require 'latex-mode-config)

;; Erlang mode
(require 'erlang-mode-config)

;; ERC
(require 'erc-mode-config)

;; HTML
(require 'html-mode-config)

;; Clojure
(require 'clojure-mode-config)

;;; Locale setting
(require 'mylocale)

;; end of my customizations
(provide 'kk-customizations)
