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
;; (autoload 'paredit-mode "paredit"
;;   "Minor mode for pseudo-structurally editing Lisp code."
;;   t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;; hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'time-stamp)

(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-vc-set-filter-groups-by-vc-root)
      (ibuffer-do-sort-by-alphabetic)))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;;; W3m
;; (setq browse-url-browser-function 'w3m-browse-url)
;; (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; ;; optional keyboard short-cut
;; (global-set-key "\C-xm" 'browse-url-at-point)


;; use 'Y' or 'N' to answer Yes/No
(defalias 'yes-or-no-p 'y-or-n-p)
;; ido mode configuration
(require 'ido-mode-config)

;; util functions
(require 'util-functions)

;; lisp-mode configuration
(require 'lisp-mode-config)

;; slime configuration
(require 'slime-config)

;; Keybindings
(require 'key-bindings)

;; org mode configuration
(require 'org-mode-config)


;; Uniquify configuration
(setq uniquify-buffer-name-style 'post-forward)

;; Latex Mode
(require 'latex-mode-config)



;;; Locale setting
(require 'mylocale)

;; ;;; Commented because currently I need to use objective-c mode for .m
;; ;;; Octave-mode
;; (require 'octave-mode-config)



;; end of my customizations
(provide 'kk-customizations)
