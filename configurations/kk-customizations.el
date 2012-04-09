;; My customizatoin file where I will load mode-specific customizations

;; Don't clutter up directories with files~
;; copied from Vedang
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat session-files-dir "backups"))))
      require-final-newline t
      save-place-file (concat session-files-dir "places")
      bookmark-default-file (concat session-files-dir "bookmarks.bmk")
      auto-save-list-file-prefix
      (concat session-files-dir "auto-save-list/.auto-saves-")
      auto-save-file-name-transforms
      `((".*" ,(concat session-files-dir "auto-save-list/") t)))
;; Paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;; hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'time-stamp)

;; Use 'Y' or 'N' to answer Yes/No
(defalias 'yes-or-no-p 'y-or-n-p)
;; ido mode configuration
(require 'ido-mode-config)

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

;;; Octave-mode
(require 'octave-mode-config)

;;; JS2 mode config
(require 'js-mode-config)

;;; Yasnippets
(require 'yasnippet-config)

;; util functions
(require 'util-functions)

(require 'template)
(template-initialize)

;; end of my customizations
(provide 'kk-customizations)
