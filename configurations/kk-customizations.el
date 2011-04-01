;; My customizatoin file where I will load mode-specific customizations

;; Don't clutter up directories with files~
;; copied from Vedang
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

;; Use 'Y' or 'N' to answer Yes/No 
(defalias 'yes-or-no-p 'y-or-n-p)
;; ido mode configuration
(require 'ido-mode-config)

;; Keybindings
(require 'key-bindings)

;; util functions
(require 'util-functions)

;; org mode configuration
(require 'org-mode-config)

;; Auto-Complete configuration
(require 'auto-complete-mode-config)

;; Python customizations
(require 'python-mode-config)

;; Flymake
(require 'flymake-config)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Uniquify configuration
(setq uniquify-buffer-name-style 'post-forward)

;; End of my customizations
(provide 'kk-customizations)
